#
# Be sure to run `pod lib lint DominoKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'DominoKit'
  s.version          = '1.3.1'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.homepage         = 'https://github.com/jarrodparkes/DominoKit'
  s.summary          = 'Swift library for creating applications with dominoes.'
  s.description      = <<-DESC
DominoKit defines structures representing individual domino and domino sets that can be used in the creation of games that use them.
                       DESC
  s.author           = { 'Jarrod Parkes' => 'parkesfjarrod@gmail.com' }
  s.source           = { :git => 'https://github.com/jarrodparkes/DominoKit.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/jarrodparkes'
  s.ios.deployment_target = '8.0'
  s.exclude_files = 'Sources/Random.swift'
  s.source_files = 'Sources/**/*'
end
