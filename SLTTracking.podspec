Pod::Spec.new do |s|
  s.name         = 'SLTTracking'
  s.version      = '1.0.0'
  s.license      =  { :type => 'MIT', :file => 'MIT-LICENSE' }
  s.homepage     = 'http://www.shoplove.com'
  s.authors      =  { "Michael Banholzer" => "michael.banholzer@shoplove.com" }
  s.summary      = 'This is the iOS Tracking SDK of ShopLove.'
  s.platform     =  :ios, '5.0'
  s.source       =  { :git => 'https://github.com/ShopLove/tracking-sdk-ios.git', :tag => "v#{s.version}" }
  s.source_files = 'SLTTracking/*.{h,m}'
  s.requires_arc = true
end