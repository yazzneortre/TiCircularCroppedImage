// This is a test harness for your module
// You should do something interesting in this harness
// to test out the module and to provide instructions
// to users on how to use it by example.


// open a single window
Titanium.UI.setBackgroundColor('#000');
var win = Titanium.UI.createWindow({
	title : 'Open Web View',
	backgroundColor : '#fff',
	exitOnClose : true
});
var imageEditor = require("metavi.iphone.circlecrop");
var cropper = imageEditor.createImageEditor();
var openButton = Ti.UI.createButton({
	title : "Open Image",
	top : "0dp",
	height : "40dp",
	left : "10dp",
	right : "10dp"
});

var imageView = Ti.UI.createImageView({
	width:200,
	height:200,
	top:50
});

openButton.addEventListener('click', function() {
	cropper.openCircleCrop();
});

cropper.addEventListener('done', function(e){
	imageView.image = e.image;
});


win.add(openButton);
win.add(imageView);
win.open();

