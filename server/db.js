const Pool = require("pg").Pool;
const env = require('./env');

const pool = new Pool({
  user: env.user,
  password: env.password,
  host: env.host,
  port: env.port,
  database: env.database
});

module.exports = pool;
