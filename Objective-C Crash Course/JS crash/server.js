var express = require('express');
var bodyParser = require('body-parser');

var app = express();

app.all('/*', function(req, res, next) {
  res.header("Access-Control-Allow-Origin", "*");

});
