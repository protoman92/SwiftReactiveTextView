Pod::Spec.new do |s|

    s.platform = :ios
    s.ios.deployment_target = '9.0'
    s.name = "SwiftReactiveTextField"
    s.summary = "Thin wrapper for UITextField that supports listening to programmatic text changes."
    s.requires_arc = true
    s.version = "1.0.3"
    s.license = { :type => "Apache-2.0", :file => "LICENSE" }
    s.author = { "Hai Pham" => "swiften.svc@gmail.com" }
    s.homepage = "https://github.com/protoman92/SwiftReactiveTextView.git"
    s.source = { :git => "https://github.com/protoman92/SwiftReactiveTextView.git", :tag => "#{s.version}"}
    s.framework = "UIKit"
    s.dependency 'SwiftUIUtilities/Main'

    s.subspec 'Main' do |main|
        main.source_files = "SwiftReactiveTextField/**/*.{swift,xib}"
    end

end
