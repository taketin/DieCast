# DieCast

DieCast is a library for convert the material (e.g. number) to the image in Swift.

## ScreenShot

<img width="487" alt="2016-02-01 23 56 02" src="https://cloud.githubusercontent.com/assets/71396/12725495/570d0b0c-c956-11e5-8aa3-778282972482.png">

## Installation

### Carthage

- Insert github "taketin/DieCast" ~> 0.1.0 to your Cartfile.
- Run `carthage update`.
- Link your app with `DieCast.framework` in `Carthage/Build`

## Usage

- Look at `Demo` App. very easy.
- If you want to use your own images with Asset Catalog, Please follow.

```Swift
if let diecast = DieCast(material: 1234567890, type: IntCast.Custom, filenamePrefix: "your_image_prefix_") {
    ...
}
```

## License

DieCast is released under the MIT license.
