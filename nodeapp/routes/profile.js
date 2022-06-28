
var express = require('express');
var router = express.Router();
var db=require("../config/database");
var fileUpload = require('express-fileupload');





// default option


router.get('/', (req, res) => {
    res.render('pages/profile');
  
  
   db.getConnection((err, connection) =>{
        if(err) throw err;
        console.log('Connected!');
  
        connection.query('SELECT * FROM users WHERE user_id ="42"', (err, data, fields) => {
            connection.release();
            if(!err){
                res.render('profile', { userData: data });
                console.log('going to retrieve');
            }
           
        })
     });
  });
  router.post('/', (req, res) => {
    let file1;
    let uploadPath;
  
    if (!req.files || Object.keys(req.files).length === 0) {
        return res.status(400).send('No files were uploaded.');
    }
  
    file1 = req.files.file1;
    uploadPath = __dirname + '/upload/' + file1.name;
    console.log(file1);
  
    //use mv() to place file on the server
    file1.mv(uploadPath, function (err) {
        if (err) return res.status(500).send(err);
  
        res.send('File uploaded!');
    });
  });
  
  module.exports = router;
