#
#  Be sure to run `pod spec lint Skins.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|

spec.name         = "Skins"
spec.version      = "0.0.9"
spec.summary      = "Theme manager for swift projects."
spec.swift_versions	  = '5.0'
spec.homepage     = "https://github.com/imotoboy/Skins"
spec.license      = "MIT (LICENSE)"
spec.author             = { "tramp" => "wg_workshop@hotmail.com" }
spec.platform     = :ios
spec.requires_arc = true


#  When using multiple platforms
spec.ios.deployment_target = "9.0"
# spec.osx.deployment_target = "10.7"
# spec.watchos.deployment_target = "2.0"
# spec.tvos.deployment_target = "9.0"
spec.source       = { :git => "https://github.com/imotoboy/Skins.git", :tag => "#{spec.version}" }

spec.source_files  = 'Skins/*.{swift, h}', 'Skins/**/*.swift'
# spec.exclude_files = "Skins/Extensions"

# spec.public_header_files = "Classes/**/*.h"

spec.ios.frameworks = 'UIKit', 'Foundation', 'QuartzCore', 'SafariServices'
# spec.tvos.frameworks = 'UIKit', 'Foundation', 'QuartzCore', 'SafariServices'

# ――― Project Settings ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

# 解决在xcode 12下验证不通过的问题
# spec.pod_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
# spec.user_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }

end
