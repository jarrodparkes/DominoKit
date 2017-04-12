Pod::Spec.new do |s|
  s.name             = 'DominoKit'
  s.version          = '1.4.0'
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
  s.exclude_files = 'Sources/SPM+Random.swift'
  s.source_files = 'Sources/**/*'
end
