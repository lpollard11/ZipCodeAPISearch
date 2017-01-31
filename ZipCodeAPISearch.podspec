#
# Be sure to run `pod lib lint ZipCodeAPISearch.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ZipCodeAPISearch'
  s.version          = '0.1.0'
  s.summary          = 'ZipCodeAPISearch returns location for a zip code using the ZipCodeAPI.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = 'ZipCodeAPISearch provides a lightweight framework that performs a network call to fetch location data using a zip code from the public ZipCodeAPI. It makes use of the Alamofire for the network requst and Gloss to serialize the JSON data into working models.'


  s.homepage         = 'https://github.com/lpollard11/ZipCodeAPISearch.git'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'lpollard11' => 'tjdet11@gmail.com' }
  s.source           = { :git => 'https://github.com/lpollard11/ZipCodeAPISearch.git', :tag => '0.1.0' }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.source_files = 'ZipCodeAPISearch/Classes/**/*'
  
  # s.resource_bundles = {
  #   'ZipCodeAPISearch' => ['ZipCodeAPISearch/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
  s.dependency 'Alamofire', '~> 4.3.0'
  s.dependency 'Gloss', '~> 1.2.0'
end
