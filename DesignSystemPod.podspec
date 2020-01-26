Pod::Spec.new do |s|
    s.name             = 'DesignSystemPod'
    s.version          = '0.0.1'
    s.summary          = 'SDK de exemplo para o Cocoaheads'
  
    s.description      = <<-DESC
    Pod de componentes seguindo principios de Design System.
                         DESC
  
    s.homepage         = 'https://github.com/thelineh/designSystemCocoaheads'
    s.license          = { :type => "MIT", :file => "LICENSE" }
    s.author           = { 'theLineh' => '@theLineh' }
    s.source           = { :git => 'git@github.com:thelineh/designSystemCocoaheads.git', :tag => s.version.to_s }
  
    s.ios.deployment_target = '12.0'
    s.swift_version = '5.0'
  
    s.source_files = [
      'DesignSystemPod/DesignSystemPod/Classes/**/*',
      'DesignSystemPod/DesignSystemPod/Configuration/**/*'
    ]
    s.resources = 'DesignSystemPod/DesignSystemPod/Assets/*'
    s.exclude_files = 'DesignSystemPod/**/*Tests.{swift}'
    s.dependency 'Nuke', '~> 7.6.0'
  end