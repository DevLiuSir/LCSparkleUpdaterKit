Pod::Spec.new do |spec|

  spec.name         = "LCSparkleUpdaterKit"
  
  spec.version      = "1.0.0"
  
  spec.summary      = "LCSparkleUpdaterKit is an application update framework based on Sparkle."
  
  spec.description  = <<-DESC
  LCSparkleUpgraderKit is a portable application update framework developed based on Sparkle！
                   DESC

  spec.homepage       = "https://github.com/DevLiuSir/LCSparkleUpdaterKit"
  
  spec.license        = { :type => "MIT", :file => "LICENSE" }
  
  spec.author         = { "Marvin" => "93428739@qq.com" }
  
  spec.swift_versions = ['5.0']
  
  spec.platform       = :osx
  
  spec.osx.deployment_target = "10.14"

  spec.source         = { :git => "https://github.com/DevLiuSir/LCSparkleUpdaterKit.git", :tag => "#{spec.version}" }
  
  spec.source_files   = "Sources/LCSparkleUpdaterKit/**/*.{h,m,swift}"

 # 添加 Sparkle 依赖
  spec.dependency   'Sparkle'

end
