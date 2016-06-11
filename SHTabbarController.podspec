#
# Be sure to run `pod lib lint SHTabbarController.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
s.name             = 'SHTabbarController'
s.version          = '0.1.0'
s.summary          = 'A simple UITabbarController with round center button.'
s.homepage         = 'https://github.com/harushuu/SHTabbarController'
# s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
s.license          = { :type => 'MIT', :file => 'LICENSE' }
s.author           = { '@harushuu' => 'hunter4n@gmail.com' }
s.source           = { :git => 'https://github.com/harushuu/SHTabbarController.git', :tag => '0.1.0' }
s.platform     = :ios, '8.0'
s.requires_arc = true
s.source_files = 'SHTabbarController/*'
s.frameworks = 'UIKit'
s.dependency 'BFPaperButton', '~> 2.0.29'
end
