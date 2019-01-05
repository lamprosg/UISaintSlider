# UISaintSlider

[![Build Status](https://travis-ci.org/lamprosg/UISaintSlider.svg?branch=master)](https://travis-ci.org/lamprosg/UISaintSlider)

<p align="left">
<img src="Screenshot.png" title="LazyImage" float=left>
</p>

A simple UISlider subclass which adds a transparent ring around the slider's main small round image

The thumb position is adjusted to start/end in the small inner circle instead of the entire thumb image.

The thumb image color changes according the slider's tint color

The main thumb image size and the transparent ring are both adjustable using these 2 properties
```swift
let dotDiameter:CGFloat = 10
let dotSaintSizeMultiplier:CGFloat = 3
```

Simple setup for the slider
```swift
@IBOutlet weak var slider: UISaintSlider!

//Set the thumb Image
let thumbImage = self.slider.createThumbImage()

self.slider.setThumbImage(thumbImage, for: .normal)
self.slider.setThumbImage(thumbImage, for: .highlighted)
self.slider.setThumbImage(thumbImage, for: .selected)
```
