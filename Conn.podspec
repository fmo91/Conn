#
# Be sure to run `pod lib lint Conn.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Conn'
  s.version          = '0.1.0'
  s.summary          = 'Minimal yet modular networking layer for Swift.'
  s.description      = <<-DESC
Conn is a very lightweight networking library written in Swift 4. Conn allows developers to write their networking layers in a declarative manner, using Codable under the hood.
                       DESC
  s.homepage         = 'https://github.com/fmo91/Conn'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'fmo91' => 'ortizfernandomartin@gmail.com' }
  s.source           = { :git => 'https://github.com/fmo91/Conn.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '11.0'

  s.source_files = 'Conn/Classes/**/*'
  
  # s.resource_bundles = {
  #   'Conn' => ['Conn/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
