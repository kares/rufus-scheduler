
Gem::Specification.new do |s|

  s.name = 'rufus-scheduler-em'
  s.version = '1.0.0'
  s.authors = [ 'John Mettraux' ]
  s.email = 'jmettraux@gmail.com'
  s.homepage = 'http://rufus.rubyforge.org/'
  s.platform = Gem::Platform::RUBY
  s.summary = 'rufus-scheduler but based on EventMachine'

  s.require_path = 'lib'
  s.test_file = 'spec/spec.rb'
  s.has_rdoc = true
  s.extra_rdoc_files = %w{ README.txt CHANGELOG.txt CREDITS.txt LICENSE.txt }
  s.rubyforge_project = 'rufus'

  %w{ eventmachine }.each do |d|
    s.requirements << d
    s.add_dependency(d)
  end

  #s.files = Dir['lib/**/*.rb'] + Dir['*.txt'] - [ 'lib/tokyotyrant.rb' ]
  s.files = Dir['lib/**/*.rb'] + Dir['*.txt']
end

