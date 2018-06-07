#
# Be sure to run `pod lib lint KYContact.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'KYContact'
  s.version          = '0.1.0'
  s.summary          = 'KYContact是基于AddressBook.framework和Contact.framework框架支持iOS 8.0以上的通讯录框架.'
  s.homepage         = 'https://github.com/kingly09/KYContact'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'kingly09' => 'libintm@163.com' }
  s.source           = { :git => 'https://github.com/kingly09/KYContact.git', :tag => s.version.to_s }
  s.ios.deployment_target = '8.0'
  s.source_files = 'KYContact/Classes/**/*'
  
  # s.resource_bundles = {
  #   'KYContact' => ['KYContact/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
