# UISaintSlider
A simple UISlider subclass with a transparent ring around the slider thumb image

```swift
@IBOutlet weak var slider: UISaintSlider!

//Normal image
imageview.image = UIImage(named:"someAsset")

//Network image
imageView.imageURL = "https://domain.com/thepathtotheimage.png"

//Set the thumb Image
let thumbImage = self.slider.createThumbImage()

self.slider.setThumbImage(thumbImage, for: .normal)
self.slider.setThumbImage(thumbImage, for: .highlighted)
self.slider.setThumbImage(thumbImage, for: .selected)
```
