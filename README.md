# DieCast
[![Build Status](https://travis-ci.org/taketin/DieCast.svg?branch=master)](https://travis-ci.org/taketin/DieCast)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

DieCast is a library for convert the material (e.g. number) to the image in Swift.

## ScreenShot

<img width="487" alt="2016-02-01 23 56 02" src="https://cloud.githubusercontent.com/assets/71396/12725495/570d0b0c-c956-11e5-8aa3-778282972482.png">

## Installation

### Carthage

- Insert `github "taketin/DieCast" ~> 0.1.1` to your Cartfile.
- Run `carthage update`.
- Link your app with `DieCast.framework` in `Carthage/Build`

### CocoaPods

- Insert `pod 'DieCast', '~> 0.1.1'` to your Podfile.
- Run `pod install`

## Usage

Look at `Demo` App. very easy.

```swift
if let diecast = DieCast(material: 1234567890) {
    let diecastView = diecast.press()
    view.addSubview(diecastView)
}
```

If you want to use your own images with Asset Catalog, Please follow.

(The numbers of the image, please put the file name from 0 to 9 after the prefix.)

```swift
if let diecast = DieCast(material: 1234567890, type: IntCast.Custom, filenamePrefix: "your_image_prefix_") {
    ...
}
```

### Custom settings

- `magnification`
- `height`
- `margin`

Please follow.

```swift
if let diecast = DieCast(material: 1234567890) {
    // setting to magnification of image.
    diecast.magnification = 0.06

    // setting to height of image, width will be the same ratio.
    // (magnification will be applied in priority.)
    diecast.height = 50

    // setting to margin of each images.
    diecast.margin = 5.0

    let diecastView = diecast.press()
    view.addSubview(diecastView)
}
```

## License

DieCast is released under the MIT license.
