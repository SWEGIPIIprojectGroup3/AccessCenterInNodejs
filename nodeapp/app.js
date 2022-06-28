var createError = require('http-errors');
var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');


var expressSession = require('express-session');

var indexRouter = require('./routes/index');
//var usersRouter = require('./routes/users');
//var aboutRouter = require('./routes/about');
var profileRouter = require('./routes/profile');
var loginRouter = require('./routes/login');
var signupRouter = require('./routes/signup');
var bookRouter = require('./routes/Book');
var app = express();
const flash = require('connect-flash');
app.use(flash());
const session = require('express-session');
app.use(session({
			name: 'session',
			secret: 'my_secret',
			resave: false,
			saveUninitialized: true,
			cookie: {maxAge: 3600 * 1000}, // 1hr
		}
	));


// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));

app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));
app.use(expressSession({secret: 'max', saveUninitialized: false, resave: false}));

app.use('/', indexRouter);
//app.use('/users', usersRouter);
//app.use('/about', aboutRouter);
app.use('/profile', profileRouter);
app.use('/login', loginRouter);
app.use('/signup', signupRouter);
app.use('/Book',bookRouter);
app.use(require('./routes/authenticate-user'));
app.use(require('./routes/courses'));

// catch 404 and forward to error handler
app.use(function(req, res, next) {
  var err = new Error('Not Found');
  err.status = 404;
  next(err);
});



// error handler
app.use(function(err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.render('error');
});

module.exports = app;
