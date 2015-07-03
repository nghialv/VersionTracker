Pod::Spec.new do |s|
  s.name         = "VersionTracker"
  s.version      = "0.0.1"
  s.summary      = "Tracking app version"
  s.homepage     = "https://github.com/nghialv/VersionTracker"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "Le Van Nghia" => "nghialv2607@gmail.com" }
  s.social_media_url   = "https://twitter.com/nghialv2607"

  s.platform     = :ios
  s.ios.deployment_target = "8.0"
  s.source       = { :git => "https://github.com/nghialv/VersionTracker.git", :tag => "0.0.1" }
  s.source_files  = "VersionTracker/*"
  s.requires_arc = true
end
