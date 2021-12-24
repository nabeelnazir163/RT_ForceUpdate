#
# Be sure to run `pod lib lint RT_ForceUpdate.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'RT_ForceUpdate'
  s.version          = '0.1.0'
  s.summary          = 'RT_ForceUpdate is pod to show Force update in one line of code (if required)'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
'RT_ForceUpdate is specially made for one particular organization known as Renesis Tech pvt ltd. This is pod to show Force update in one line of code (if required). RT_ForceUpdate offer some customisation as well. It compares local app version and compares it renesis server and show dialog of local app version is lesser than remote version'
                       DESC

  s.homepage         = 'https://github.com/nabeelnazir163/RT_ForceUpdate'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Nabeel' => 'nabeelnazir163@gmail.com' }
  s.source           = { :git => 'https://github.com/nabeelnazir163/RT_ForceUpdate.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.source_files = 'RT_ForceUpdate/Classes/**/*'
  
  # s.resource_bundles = {
  #   'RT_ForceUpdate' => ['RT_ForceUpdate/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
