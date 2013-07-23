Pod::Spec.new do |s|
  s.name = 'SEHumanizedTimeDiff'
  s.version = '0.0.1'
  s.license = 'MIT'
  s.summary = 'SEHumanizedTime is a NSDate Category for you to have humanly meaningful time intervals between dates.'
  s.description = <<-DESC
                    SEHumanizedTime is a NSDate Category for you to have humanly meaningful time intervals between dates. It is especially useful for use in social apps with timelines of events.
                  DESC
  s.homepage = 'https://github.com/sarperdag/SEHumanizedTimeDiff'
  s.author = { 'Sarp Erdag' => 'sarp.erdag@apperto.com' }
  s.source = { :git => 'https://github.com/sarperdag/SEHumanizedTimeDiff.git', :tag => '0.0.1' }
  s.source_files = 'SEHumanizedTime/*.{h,m}'
  s.resources = 'SEHumanizedTime/{en,de,ja,tr,zh-Hans}.lproj'

  s.frameworks = 'Foundation'
end