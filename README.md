# RT_ForceUpdate

[![CI Status](https://img.shields.io/travis/Nabeel/RT_ForceUpdate.svg?style=flat)](https://travis-ci.org/Nabeel/RT_ForceUpdate)
[![Version](https://img.shields.io/cocoapods/v/RT_ForceUpdate.svg?style=flat)](https://cocoapods.org/pods/RT_ForceUpdate)
[![License](https://img.shields.io/cocoapods/l/RT_ForceUpdate.svg?style=flat)](https://cocoapods.org/pods/RT_ForceUpdate)
[![Platform](https://img.shields.io/cocoapods/p/RT_ForceUpdate.svg?style=flat)](https://cocoapods.org/pods/RT_ForceUpdate)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

RT_ForceUpdate is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'RT_ForceUpdate'
```
## Usage

You can use check is your app needs to update in one line of code and if yes it shows a dialog

```
  ForceUpdateManager.shared.checkIfAppVersionIsCompatible(with: "YOUR_SLUG")
```

## Customisation

There is an option to customise the color and fonts as well.

``` 
  ForceUpdateManager.shared.contentTextColor = .gray
  ForceUpdateManager.shared.contentViewBGColor = UIColor.white
  ForceUpdateManager.shared.doneButtonBGColor = UIColor.black
  ForceUpdateManager.shared.doneButtonTextColor = UIColor.white
  ForceUpdateManager.shared.contentTextColor = UIColor.black
  ForceUpdateManager.shared.placeHolderImageTintColor = UIColor.black
  ForceUpdateManager.shared.fontFamily = "YOUR_FONT_NAME"
  ForceUpdateManager.shared.alternateURLToLoad = "YOUR_DESIRED_URL"

```

![Alt text](https://drive.google.com/file/d/1wuF3KBOr_3ry0CjcYPA9qZac5o0_yXLs/view?usp=sharing "Screenshot")

## Author

Nabeel, nabeel@renesistech.com

## License

RT_ForceUpdate is available under the MIT license. See the LICENSE file for more info.
