const { spawn } = require("node:child_process");

function sqlEscape(value) {
  if (value === null || value === undefined) return "NULL";
  if (typeof value === "number") return Number.isFinite(value) ? String(value) : "NULL";
  if (typeof value === "boolean") return value ? "1" : "0";
  return `N'${String(value).replace(/'/g, "''")}'`;
}

function bindParams(sqlText, params = []) {
  let i = 0;
  return sqlText.replace(/\?/g, () => sqlEscape(params[i++]));
}

function runSql(query) {
  const server = process.env.DB_SERVER || "(local)";
  const database = process.env.DB_NAME || "customer_behavior";
  
  // Notice we omit the -Q parameter here to read from standard input instead
  const args = ["-S", server, "-d", database, "-W", "-h", "1", "-w", "65535", "-s", "\t", "-b"];

  return new Promise((resolve, reject) => {
    const child = spawn("sqlcmd", args);
    let stdout = "";
    let stderr = "";

    child.stdout.on("data", (data) => {
      stdout += data.toString();
    });

    child.stderr.on("data", (data) => {
      stderr += data.toString();
    });

    child.on("close", (code) => {
      if (code !== 0) {
        reject(new Error(stderr || stdout || `sqlcmd exited with code ${code}`));
      } else {
        resolve(stdout);
      }
    });

    // Write query to stdin and close the stream
    child.stdin.write(query);
    child.stdin.end();
  });
}

function parseRows(stdout) {
  const lines = stdout
    .split(/\r?\n/)
    .map((line) => line.trimEnd())
    .filter((line) => line.trim().length > 0);

  const useful = lines.filter(
    (line) =>
      !line.startsWith("-") &&
      !line.startsWith("(") &&
      !line.toLowerCase().includes("rows affected") &&
      !line.toLowerCase().includes("changed database context")
  );

  if (useful.length < 2) {
    return [];
  }

  const headers = useful[0].split("\t").map((h) => h.trim());
  const rows = [];

  for (const line of useful.slice(1)) {
    const cells = line.split("\t").map((v) => v.trim());
    const isHeaderRepeat = cells.length === headers.length && cells.every((cell, index) => cell === headers[index]);
    if (isHeaderRepeat) {
      continue;
    }
    const row = {};
    headers.forEach((header, index) => {
      const value = cells[index] ?? null;
      row[header] = value === "NULL" ? null : value;
    });
    rows.push(row);
  }

  return rows;
}

async function queryAll(sqlText, params = []) {
  const query = `SET NOCOUNT ON; ${bindParams(sqlText, params)};`;
  const output = await runSql(query);
  return parseRows(output);
}

async function queryOne(sqlText, params = []) {
  const rows = await queryAll(sqlText, params);
  return rows.length ? rows[0] : null;
}

async function execute(sqlText, params = []) {
  const query = `SET NOCOUNT ON; ${bindParams(sqlText, params)}; SELECT CAST(SCOPE_IDENTITY() AS INT) AS id;`;
  const output = await runSql(query);
  const rows = parseRows(output);
  const identityRow = rows.find((row) => Object.prototype.hasOwnProperty.call(row, "id"));
  const identity = identityRow && identityRow.id != null ? Number(identityRow.id) : null;
  return Number.isFinite(identity) ? identity : null;
}

module.exports = { queryAll, queryOne, execute };
