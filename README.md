# Titanium module for CropImage

My first attempt to build a native module for iPhone / Titanium.

Crop circular of images Titanium mobile.
This version use [TOCropViewController](https://github.com/TimOliver/TOCropViewController)

Import the module in your code with:

```js
var imageEditor = require("metavi.iphone.circlecrop");
```

then create an instance and open the editor:

```js
var cropper = imageEditor.createImageEditor();
cropper.openCircleCrop();
```

It is not necessary pass image, this uses the native image picker.
