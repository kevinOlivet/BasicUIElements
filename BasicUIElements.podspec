
Pod::Spec.new do |s|
  s.name             = 'BasicUIElements'
  s.version          = '1.0.0'
  s.summary          = 'BasicUIElements Module'

  s.description      = <<-DESC
  This is the home to the shared Basic UIElements
                       DESC

  s.homepage         = 'https://japanart1234.wixsite.com/jonolivet/ios-developer-info'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Jon Olivet' => 'kevinolivet@yahoo.com' }
  s.source           = { :git => 'ssh://git@github.com/kevinOlivet/BasicUIElements.git', :tag => s.version.to_s }

  s.ios.deployment_target = '11.0'
  s.swift_version = '5.0'

  s.source_files = 'BasicUIElements/Classes/**/*'
  s.resources = [
  'BasicUIElements/Assets/**/*.{storyboard,xib,xcassets,html,json,pdf,otf,ttf,plist,strings}'
  ]

  s.dependency 'BasicCommons'
  s.dependency "lottie-ios"

  s.xcconfig = {
    "CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES" => "YES",
    "ENABLE_BITCODE" => "YES",
  }

  # s.script_phases = [
  #   {
  #     :name => 'SwiftlintLocalModules',
  #     :script => '$SRCROOT/../configurations/Build-Phases/swiftlint_locals_modules_execute.sh',
  #     :show_env_vars_in_log => true,
  #     :execution_position => :before_compile
  #   }
  # ]
end