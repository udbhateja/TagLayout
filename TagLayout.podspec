#
# Be sure to run `pod lib lint TagLayout.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'TagLayout'
  s.version          = '0.1.0'
  s.summary          = 'Library allowing easily showing of text tags in UICollectionView'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  'A subclass of UICollectionViewLayout to achieve tags in CollectionView. Easy to integrate and use. Written in Swift and works with UIKit.
                       DESC

  s.homepage         = 'https://github.com/udbhateja/TagLayout'
  s.screenshots      = 'https://github.com/udbhateja/TagLayout/raw/master/Screenshots/1.png', 'https://github.com/udbhateja/TagLayout/raw/master/Screenshots/2.png'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'udbhateja' => 'udaybhateja@ymail.com' }
  s.source           = { :git => 'https://github.com/udbhateja/TagLayout.git', :tag => s.version }
  s.social_media_url = 'https://twitter.com/udbhateja'

  s.ios.deployment_target = '9.0'
  s.swift_versions = ['5.1', '5.2', '5.3']

  s.source_files = 'Sources/*.{swift}'

  # s.resource_bundles = {
  #   'TagLayout' => ['TagLayout/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
