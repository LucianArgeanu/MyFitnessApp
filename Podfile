platform :ios, '9.0'

target 'MyFitnessApp' do

  use_frameworks!

  # Pods for MyFitnessApp

pod 'FirebaseCore', '6.3.1'
pod 'FirebaseFirestore', '1.6.0'
pod 'FirebaseAuth', '6.3.0'
pod 'FirebaseDatabase', '6.1.2'
pod 'ProgressHUD'
pod 'SDWebImage', '5.4.1'

end

post_install do |installer|
installer.pods_project.targets.each do |target|
target.build_configurations.each do |config|
config.build_settings['CLANG_WARN_DOCUMENTATION_COMMENTS'] = 'NO'
end
end
end
