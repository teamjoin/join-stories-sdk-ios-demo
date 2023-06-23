
source 'https://github.com/CocoaPods/Specs.git'
 
platform :ios, '13.0'
use_frameworks!

target 'join-stories-sdk-ios-demo' do
  pod 'JoinStoriesSDK', '~> 1.3.0'
  pod 'SnapKit', '~> 5.0.0'
end

target 'join-stories-sdk-swift-ui-demo' do
  pod 'JoinStoriesSDK', '~> 1.3.0'
  pod 'SnapKit', '~> 5.0.0'
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['BUILD_LIBRARY_FOR_DISTRIBUTION'] = 'YES'
    end
  end
end
