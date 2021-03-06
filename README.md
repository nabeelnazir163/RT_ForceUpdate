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

You can use this to check if your app needs to update? If yes it shows a dialog. All you can achieve by writing one line of code.

```
  ForceUpdateManager.shared.checkIfAppVersionIsCompatible(with: "YOUR_SLUG")
```

## Customisation

There is an option to customise the color and fonts as well.

``` 
  ForceUpdateManager.shared.contentTextColor = .gray
  ForceUpdateManager.shared.contentViewBGColor = .white
  ForceUpdateManager.shared.doneButtonBGColor = .black
  ForceUpdateManager.shared.doneButtonTextColor = .white
  ForceUpdateManager.shared.contentTextColor = .black
  ForceUpdateManager.shared.placeHolderImageTintColor = .black
  ForceUpdateManager.shared.fontFamily = "YOUR_FONT_NAME"
  ForceUpdateManager.shared.alternateURLToLoad = "YOUR_DESIRED_URL"

```

![Alt text](https://fv9-3.failiem.lv/thumb_show.php?i=f3acdh4my&view "Screenshot")

## Author

Nabeel, nabeelnazir163@gmail.com

## License

RT_ForceUpdate is available under the MIT license. See the LICENSE file for more info.
