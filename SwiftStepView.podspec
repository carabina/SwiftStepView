
Pod::Spec.new do |s|

s.name         = "SwiftStepView"
s.version      = "0.0.1"
s.summary      = "A step view written in Swift"

s.description  = <<-DESC
SwiftStepView is a step view written in Swift. It's simple and easy to use.
DESC

s.homepage     = "https://github.com/derekcoder/SwiftStepView"
s.license      = { :type => 'MIT', :file => 'LICENSE' }
s.author       = { "derekcoder" => "derekcoder@gmail.com" }
s.source       = { :git => "https://github.com/derekcoder/SwiftStepView.git", :tag => s.version.to_s }

s.ios.deployment_target = '10.0'

s.source_files  = ['SwiftStepView/Sources/*.swift', 'SwiftStepView/SwiftStepView.h']
s.pod_target_xcconfig = { 'SWIFT_VERSION' => '4.0' }

end
