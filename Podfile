# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

# Necessary for using Swift in CocoaPods
use_frameworks!

def testing_pods
  pod 'Quick'
  pod 'Nimble'
  pod 'SwiftyJSON'
  pod 'Alamofire'
end

target 'ReviewsFetcherTests' do
  testing_pods
end

target 'ReviewsFetcherUITests' do
  testing_pods
end

target 'ReviewsFetcher' do
  pod 'SwiftyJSON'
  pod 'Alamofire'
  pod 'OAuthSwift', '~> 1.1.0'
end
