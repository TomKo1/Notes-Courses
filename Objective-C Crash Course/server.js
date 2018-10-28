var express = require('express');
var bodyParser = require('body-parser');
var app = express();

app.all('/*', function(req, res, next) {
  res.header("Access-Control-Allow-Origin", "*");
  res.header("Access-Control-Allow-Headers", "X-Requested-With", "Content-Type, Accept");
  res.header("Access-Control-Allow-Methods", "POST, GET");
  next();
});

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended: false}));


var tutorials = [
  {
    id: 1,
    title: "Android Studio Tutorial For Beginners",
    description: "Learn how to install Android Studio and then go through this tutorial to build your very first app",
    iframe: '<div class="container"><iframe class="video" src="https://www.youtube.com/embed/F-k5gwz_91o" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe></div>',
    thumbnail: "http://pngimg.com/uploads/android_logo/android_logo_PNG12.png"
  },
  {
    id: 2,
    title: "iOS Tutorial: How To Download Images in Swift",
    description: "Downloading images in Swift is a must-know skill for any iOS developer. In this beginners tutorial, learn how to use URLSession, a robust framework provided by Apple, to download an image from online.",
    iframe: '<div class="container"><iframe class="video" src="https://www.youtube.com/embed/Q4R2hGU9gVo" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe></div>',
    thumbnail: "https://http2.mlstatic.com/10-adesivos-mac-apple-vinil-aco-escovado-ou-preto-refletivo-D_NQ_NP_385321-MLB20756845708_062016-O.jpg"
  },
  {
    id: 3,
    title: "Start learning to code at Devslopes!",
    description: "Devslopes is dedicated to teaching beginners and non-programmers all about building mobile apps for iOS and Android.",
    iframe: '<div class="container"><iframe class="video" src="https://www.youtube.com/embed/Y2MToFXP8bw" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe></div>',
    thumbnail: "https://res-3.cloudinary.com/crunchbase-production/image/upload/c_lpad,h_256,w_256,f_auto,q_auto:eco/v1482470823/bsimhmmdqaianas8eagr.png"
  },
  {
    id: 4,
    title: "3/3 Mapbox SDK – Drawing Route Polyline",
    description: "In this lesson, you will write a function that will generate a custom polyline for the route generated between origin and destination and add it to the map view. This tutorial features version 0.16.0 of the SDK.",
    iframe: '<div class="container"><iframe class="video" src="https://www.youtube.com/embed/qZZHDN77_Uc" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe></div>',
    thumbnail: "https://banner2.kisspng.com/20180527/cbi/kisspng-ios-sdk-software-development-kit-iphone-5b0a898001c1f9.1158369215274172160072.jpg"
  }
]

var comments = [
  {
    username: "jackds942",
    comment: "This video was really cool. Any chance you colud drop what you are doing and code mt problem for me?"
  }
];

app.post('/comments', function(req, res){
  var comment = req.body;
  if(comment) {
    if(comment.username && comment.comment) {
      comments.push(comment);
    } else {
      res.send("You posted invalid data");
    }
  } else {
    res.send("Your post has no body!");
  }

  console.log(comments);

  res.send("You successfully posted a comment");

});

app.get('/tutorials', function(req, res){
  console.log("GET from server");
  // res.json
  res.send(tutorials);
});

app.listen(6069);


