const Pool = require("pg").Pool;

const pool = new Pool({
  user: "DBAdmin",
  password: "et6or_J2ApsukZT*KFnNo7JH",
  host: "db-project-16.postgres.database.azure.com",
  port: 5432,
  database: "finboardpern"
});

module.exports = pool;