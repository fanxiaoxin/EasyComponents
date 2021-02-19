#
#  Be sure to run `pod spec lint EasyComponents.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  These will help people to find your library, and whilst it
  #  can feel like a chore to fill in it's definitely to your advantage. The
  #  summary should be tweet-length, and the description more in depth.
  #

  spec.name         = "EasyComponents"
  spec.version      = "0.0.1"
  spec.summary      = "EasyCoding的扩展组件."
  spec.description  = <<-DESC
TODO: Add long description of the pod here.
                   DESC
                   
  spec.homepage     = "https://github.com/fanxiaoxin/EasyComponents"
  spec.license          = { :type => 'MIT', :file => 'LICENSE' }
  spec.author             = { "fanxiaoxin" => "fanxiaoxin_1987@126.com" }

  spec.source       = { :git => "https://github.com/fanxiaoxin/EasyComponents.git", :tag => spec.version.to_s }

  spec.ios.deployment_target = '10.0'
  
#  spec.source_files  = "EasyComponents/Classes/**/*"
  # spec.exclude_files = "Classes/Exclude"
  spec.swift_version = '5.3'
  
  spec.dependency 'EasyCoding', '~> 0.1.0'

  # spec.resource  = "icon.png"
  # spec.resources = "Resources/*.png"

  # spec.preserve_paths = "FilesToSave", "MoreFilesToSave"


  # ――― Project Linking ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Link your library with frameworks, or libraries. Libraries do not include
  #  the lib prefix of their name.
  #

  # spec.framework  = "SomeFramework"
  # spec.frameworks = "SomeFramework", "AnotherFramework"

  # spec.library   = "iconv"
  # spec.libraries = "iconv", "xml2"

  spec.default_subspecs = 'Controls', 'Api'
  
  # 事件
  spec.subspec 'Event' do |sub|
    sub.source_files = 'EasyComponents/Classes/Event/**/*'
    sub.pod_target_xcconfig = { 'OTHER_SWIFT_FLAGS' => ['-D','EASY_EVENT'] }
  end
  # 视图呈现
  spec.subspec 'Present' do |sub|
    sub.source_files = 'EasyComponents/Classes/Present/**/*'
  end
  # 控制器加载方案
  spec.subspec 'ViewControllerLoad' do |sub|
    sub.dependency 'EasyComponents/Present'
    sub.source_files = 'EasyComponents/Classes/ViewControllerLoad/**/*'
    sub.pod_target_xcconfig = { 'OTHER_SWIFT_FLAGS' => ['-D','EASY_VIEWCONTROLLERLOAD'] }
  end
  # 数据处理
  spec.subspec 'Data' do |sub|
#    sub.dependency 'MJRefresh', '~> 3.4.0'
    sub.resource_bundles = {
      'EasyComponents' => ['EasyComponents/Assets/*.xcassets']
    }
    sub.source_files = 'EasyComponents/Classes/Data/**/*'
    sub.pod_target_xcconfig = { 'OTHER_SWIFT_FLAGS' => ['-D','EASY_DATA'] }
  end
  # 控件
  spec.subspec 'Controls' do |sub|
    sub.dependency 'EasyComponents/Event'
    sub.dependency 'EasyComponents/ViewControllerLoad'
    sub.dependency 'YYKeyboardManager', '~> 1.0.0'
#    sub.dependency 'Kingfisher', '~> 5.14.0'
#    sub.dependency 'MJRefresh', '~> 3.4.0'
    sub.source_files = 'EasyComponents/Classes/Controls/**/*'
    sub.pod_target_xcconfig = { 'OTHER_SWIFT_FLAGS' => ['-D','EASY_CONTROLS'] }
  end
  # Api封装
  spec.subspec 'Api' do |sub|
    sub.dependency 'EasyComponents/Data'
    sub.dependency 'Moya', '~> 13.0'
    sub.dependency 'HandyJSON', '~> 5.0.0'
    sub.source_files = 'EasyComponents/Classes/Api/**/*'
  end
  # Kingfisher扩展
  spec.subspec 'Kingfisher' do |sub|
    sub.dependency 'Kingfisher', '~> 6.0'
  end
  # MJRefresh扩展
  spec.subspec 'MJRefresh' do |sub|
    sub.dependency 'MJRefresh', '~> 3.4'
  end
  # Promise扩展
  spec.subspec 'Promise' do |sub|
    sub.dependency 'PromiseKit', '~> 6.13'
  end
  # 个性化方案
  spec.subspec 'Personalized' do |sub|
    sub.source_files = 'EasyComponents/Classes/Personalized/**/*'
  end
  # 个性化方案
  spec.subspec 'Personalized' do |sub|
    sub.source_files = 'EasyComponents/Classes/Personalized/**/*'
  end
  # 主题方案
  spec.subspec 'ThemeManager' do |sub|
    sub.source_files = 'EasyComponents/Classes/ThemeManager/**/*'
  end
  # ――― Project Settings ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  If your library depends on compiler flags you can set them in the xcconfig hash
  #  where they will only apply to your library. If you depend on other Podspecs
  #  you can include multiple dependencies to ensure it works.

  # spec.requires_arc = true

  # spec.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # spec.dependency "JSONKit", "~> 1.4"

end
