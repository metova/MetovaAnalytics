Pod::Spec.new do |s|
  s.name         = 'MetovaAnalytics'
  s.version      = '0.1.0'
  # s.summary      = 'TODO: Add summary and remove comment mark'

  s.homepage = 'http://metova.com'
  s.license  = { :type => 'MIT', :file => 'LICENSE' }
  s.authors  = { 'Nick Griffith' => 'nick.griffith@metova.com' }

  s.source = { :git => 'https://github.com/metova/MetovaAnalytics.git', :tag => s.version.to_s }

  s.platform = :ios, '11.0'
  s.swift_version = '4.0'

  s.source_files        = 'MetovaAnalytics', 'MetovaAnalytics/**/*.{h,m,swift}'
  s.public_header_files = 'MetovaAnalytics/**/*.h'
  s.exclude_files       = 'MetovaAnalytics/Exclude'
end
