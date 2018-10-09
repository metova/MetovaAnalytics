Pod::Spec.new do |s|
  s.name         = 'MetovaAnalytics'
  s.version      = '0.2.0'
  s.summary      = 'MetovaAnalytics is an analytics scaffolding framework.'

  s.homepage = 'http://metova.com'
  s.license  = { :type => 'MIT', :file => 'LICENSE' }
  s.authors  = {
    'Metova, Inc.' => 'pods@metova.com',
    'Nick Griffith' => 'nick.griffith@metova.com',
    'Chris Martin' => 'chris.martin@metova.com',
    'Chris Dillard' => 'chris.dillard@metova.com'
  }

  s.source = { :git => 'https://lab.metova.com/metova/analytics-ios.git', :tag => s.version.to_s }

  s.platform = :ios, '9.0'
  s.swift_version = '4.2'

  s.default_subspecs = 'Core'

  s.subspec 'Core' do |core|
    core.source_files = [
      'MetovaAnalytics/Core',
      'MetovaAnalytics/Core/**/*.{h,m,swift}'
    ]
    core.public_header_files = [
      'MetovaAnalytics/Core/**/*.h'
    ]
    core.exclude_files = [
      'MetovaAnalytics/Core/Exclude'
    ]
  end
  
  s.subspec 'Firebase' do |firebase|
    firebase.dependency 'MetovaAnalytics/Core'
    firebase.dependency 'Firebase'
	
    firebase.source_files = [
      'MetovaAnalytics/Firebase',
      'MetovaAnalytics/Firebase/**/*.{h,m,swift}'
    ]
    firebase.exclude_files = [
      'MetovaAnalytics/Firebase/Exclude'
    ]
  end
  
  s.subspec 'Crashlytics' do |crashlytics|
     crashlytics.dependency 'MetovaAnalytics/Core'
     crashlytics.dependency 'Crashlytics'
     crashlytics.dependency 'Firebase'

    crashlytics.source_files = [
      'MetovaAnalytics/Crashlytics',
      'MetovaAnalytics/Crashlytics/**/*.{h,m,swift}'
    ]
    crashlytics.exclude_files = [
      'MetovaAnalytics/Crashlytics/Exclude'
    ]
  end

end
