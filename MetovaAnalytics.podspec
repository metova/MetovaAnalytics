Pod::Spec.new do |s|
  s.name         = 'MetovaAnalytics'
  s.version      = '0.2.0'
  s.summary      = 'MetovaAnalytics is an analytics scaffolding framework.'

  s.homepage = 'http://metova.com'
  s.license  = { :type => 'MIT', :file => 'LICENSE' }
  s.authors  = { 'Nick Griffith' => 'nick.griffith@metova.com' }

  s.source = { :git => 'https://lab.metova.com/metova/analytics-ios.git', :tag => s.version.to_s }

  s.platform = :ios, '9.0'
  s.swift_version = '4.2'

  s.source_files        = 'MetovaAnalytics/Core', 'MetovaAnalytics/Core/**/*.{h,m,swift}'
  s.public_header_files = 'MetovaAnalytics/Core/**/*.h'
  s.exclude_files       = 'MetovaAnalytics/Core/Exclude'
end
