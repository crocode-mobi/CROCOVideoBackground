Pod::Spec.new do |s|
  s.name             = "CROCOVideoBackground"
  s.version          = "1.0.0"
  s.summary          = "Simple Objective C category for Video Backgrounds"
 
  s.description      = <<-DESC
CROCOVideoBackground class is a Objective C category that expand from UIView. It provides a simple way to put a video Background into UIView. The class is designed to make it quick and easy show videos, play and stop it.
                       DESC

  s.homepage         = "https://github.com/crocode-mobi/CROCOVideoBackground"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "pb.ojeda" => "pablo@crocode.mobi", "robmarco" => "roberto@crocode.mobi" }
  s.source           = { :git => "https://github.com/crocode-mobi/CROCOVideoBackground.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/CrocodeMobile'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'CROCOVideoBackground' => ['Pod/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
