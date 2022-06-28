
var nodemailer = require('nodemailer');

//send email
exports.sendingMail = (email, token)=> {
	
    var email = email;
    var token = token;
	
    var mail = nodemailer.createTransport({
        service: 'gmail',
        auth: {
            user: 'nardosa953@gmail.com', // Your email id
            pass: 'hellonardos14' // Your password
        }
    });
 
    var mailOptions = {
        from: 'nardosa953@gmail.com',
        to: email,
        subject: 'Reset Password Link',
        html: '<p>You requested for reset password, kindly use this' +  
			'<a href="http://localhost:5000/reset-password?token=' + token + '">' +
			' link</a> to reset your password</p>'
    };
 
    mail.sendMail(mailOptions, function(error, info) {
        if (error)
            console.log('reset link sent')       
		else 
			console.log ('Error: link not sent')			
    });
	
}

