var mysql = require('mysql');
var conn = mysql.createConnection({
  host: 'localhost', // Replace with your host name
  port: '3306',
  user: 'Meti14',      // Replace with your database username
  password: 'metiadugna14@sql',      // Replace with your database password
  database: 'bookstore' // // Replace with your database Name
}); 
conn.connect(function(err) {
  if (err) throw err;
  console.log('Database is connected successfully !');
});
module.exports = conn;