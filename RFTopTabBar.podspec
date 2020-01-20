Pod::Spec.new do |spec|
  spec.name          = "RFTopTabBar"
  spec.version       = "0.0.2"
  spec.summary       = "A customizable top tab bar for iOS written in Swift 5.0"
  spec.homepage      = "https://github.com/Y2JChamp/RFTopTabBar"
  spec.license          = "MIT"
  spec.author        = { "Raffaele Forgione" => "r.forgione@wakala.it" }
  spec.source        = { :git => "https://github.com/Y2JChamp/RFTopTabBar.git", :tag => "#{spec.version}" }
  spec.source_files  = "Source/**/*.swift"
  spec.ios.deployment_target = "8.0"
  spec.ios.frameworks = "UIKit", "Foundation"
  spec.swift_version = "5.0"
end
