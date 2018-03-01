require_relative './lib/mdt/version'

Gem::Specification.new do |s|
  s.name = 'mdt-core'
  s.version = MDT::Core::VERSION
  s.date = '2018-03-01'
  s.summary = 'MDT Core'
  s.description = 'Core of Modular Deployment Tool'
  s.authors = ['Phitherek_']
  s.email = ['phitherek@gmail.com']
  s.files = Dir['lib/**/*.rb'] + Dir['bin/*']
  s.homepage = 'https://github.com/Phitherek/mdt-core'
  s.license = 'MIT'
  s.executables << 'mdt'
  s.extra_rdoc_files = ['README.md', 'MODULE_GUIDELINES.md']
  s.rdoc_options << '--title' << 'MDT Core' << '--main' << 'README.md' << '--line-numbers'
  s.metadata = {
      'documentation_uri' => 'http://www.rubydoc.info/github/Phitherek/mdt-core',
      'source_code_uri' => 'https://github.com/Phitherek/mdt-core'
  }
  s.add_development_dependency 'rspec', '~> 3.7'
end