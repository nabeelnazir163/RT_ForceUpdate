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

```
  ForceUpdateManager.shared.checkIfAppVersionIsCompatible(with: "YOUR_SLUG")
  ForceUpdateManager.shared.contentTextColor = .gray
  ForceUpdateManager.shared.contentViewBGColor = UIColor.white
  ForceUpdateManager.shared.doneButtonBGColor = UIColor.black
  ForceUpdateManager.shared.doneButtonTextColor = UIColor.white
  ForceUpdateManager.shared.contentTextColor = UIColor.black
  ForceUpdateManager.shared.placeHolderImageTintColor = UIColor.black
  ForceUpdateManager.shared.fontFamily = "YOUR_FONT_NAME"
  ForceUpdateManager.shared.alternateURLToLoad = "YOUR_DESIRED_URL"
```

## Author

Nabeel, nabeel@renesistech.com

## License

RT_ForceUpdate is available under the MIT license. See the LICENSE file for more info.
