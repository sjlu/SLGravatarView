Pod::Spec.new do |s|
  s.name = 'SLGravatarView'
  s.version = '0.1'
  s.license = 'MIT'
  s.summary = 'A rounded Gravatar view given an email and defaults to initials if not available'
  s.homepage = 'https://github.com/sjlu/SLGravatarView'
  s.authors = { 'Steven Lu' => 'slu@me.com' }
  s.source = { :git => 'https://github.com/sjlu/SLGravatarView.git', :tag => s.version.to_s }
  s.ios.deployment_target = '8.0'
  s.requires_arc = 'true'
  s.source_files = 'SLGravatarView/SLGravatarView.swift'
  s.dependency 'Haneke', '~> 1.0.1'
end