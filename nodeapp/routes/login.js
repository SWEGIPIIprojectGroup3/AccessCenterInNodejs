var express = require('express');
var router = express.Router();
var db=require('../config/database');
var app = express();


router.get('/', function(req, res, next) {
    res.render('auth/login', { title: 'form validation', success: req.session.success, errors: req.session.errors });
    res.session.errors= null;
    res.session.success= null;
  });
  
  router.post('/submit' , function(req, res, next){
    req.check('firstName', 'name cant be empty').isEmpty();
    req.check('lastName', 'name cant be empty').isEmpty();
    req.check('userName', 'invalid user-name').isLength({min: 6});
    req.check('mobile', 'it can only be number').isNumeric();
    req.check('email', 'Invallid email address').isEmail();
    req.check('password', 'Pssword is invalid').isLength({min: 6}).equals(req.body.Cpassword);
    var errors = req.validationErrors();
    if(errors) {
      req.session.errors = errors;
      req.session.success = false;
    }else{
      req.session.success = true;
    }
    res.redirect('/');
  });
  module.exports = router;