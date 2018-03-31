
Pod::Spec.new do |s|



  s.name         = "FirstSwiftDemo"
  s.version      = "1.0.0"
  s.summary      = "My demo is my first swift project"

  s.homepage     = "http://github.com/Balopy/FirstSwiftDemo"

  s.license      = "MIT"
 


  s.source       = { :git => "http://github.com/Balopy/FirstSwiftDemo.git", :tag => "#{s.version}" }


  s.source_files  = "FirstSwiftDemo/**/*.{h,m}"
  s.exclude_files = "Classes/Exclude"
  s.requires_arc = true # 是否启用ARC
  s.platform     = :ios, "9.0" #平台及支持的最低版本
  s.frameworks   = "UIKit", "Foundation" #支持的框架

  # s.dependency   = "Kingfisher", "Alamofire", "KYCircularProgress", "SnapKit", "GrowingTextView" # 依赖库

 # User
  s.author             = { "Balopy" => "lueng2yuan@163.com" }
  s.social_media_url   = "http://qiubaiying.github.io" # 个人主页


end
