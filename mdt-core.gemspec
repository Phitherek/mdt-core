require_relative './lib/mdt/version'

Gem::Specification.new do |s|
  s.name = 'mdt-core'
  s.version = MDT::Core::VERSION
  s.date = '2018-02-27'
  s.summary = 'MDT Core'
  s.description = 'Core of Modular Deployment Tool'
  s.authors = ['Phitherek_']
  s.email = ['phitherek@gmail.com']
  s.files = Dir['lib/**/*.rb'] + Dir['bin/*']
  s.homepage = 'https://rubygems.org/gems/mdt-core'
  s.license = 'MIT'
  s.executables << 'mdt'
  s.add_development_dependency 'rspec', '~> 3.7'
end