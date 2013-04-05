Pod::Spec.new do |s|
  s.name         = 'USStateAbbreviations'
  s.version      = '0.0.2'
  s.summary      = 'A category and plist file that work together to provide standardized access to US territory name abbreviations.'
  s.homepage     = 'https://github.com/djibouti33/US-State-Abbreviations'
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.authors      = { 'Kevin Favro' => 'kevinfavro@gmail.com', 'Norman Harebottle III' => 'normanh@gmail.com' }
  s.source       = { :git => 'https://github.com/djibouti33/US-State-Abbreviations.git', :tag => 'v' + s.version.to_s }
  s.platform     = :ios, '4.3'
  s.ios.deployment_target = '4.3'
  s.source_files = 'Classes', 'Classes/**/*.{h,m}'
  s.public_header_files = 'Classes/**/*.h'
  s.resources = ['USStateAbbreviations.plist']
end
