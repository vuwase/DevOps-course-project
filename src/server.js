const { Pool } = require('pg');

const pool = new Pool({
  user: process.env.DB_USER || 'postgres',
  host: process.env.DB_HOST || 'db',
  database: process.env.DB_NAME || 'mydb',
  password: process.env.DB_PASSWORD || 'postgres',
  port: process.env.DB_PORT || 5432,
});

// Test connection
pool.query('SELECT NOW()', (err, res) => {
  if (err) {
    console.error('Database connection failed', err.stack);
    process.exit(1); // Exit if DB connection fails
  } else {
    console.log('Database connected successfully');
    startServer();
  }
});

function startServer() {
  // Your server code here
  console.log('Server running on port 3000');
}