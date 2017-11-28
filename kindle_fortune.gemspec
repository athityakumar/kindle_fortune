lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'kindle_fortune/version'

Gem::Specification.new do |spec|
  spec.name          = 'kindle_fortune'
  spec.version       = KindleFortune::VERSION
  spec.authors       = ['Athitya Kumar']
  spec.email         = ['athityakumar@gmail.com']
  spec.summary       = 'A Ruby CLI gem that provides fortune cookie messages on your Terminal, '\
                       'based on the highlights on your Kindle device.'
  spec.homepage      = 'https://github.com/athityakumar/kindle_fortune'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end

  spec.bindir        = 'exe'
  spec.executables   = 'kindle_fortune'
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'kindleclippings'

  spec.add_development_dependency 'bundler', '~> 1.15'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rspec-its'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'rubocop-rspec'
  spec.add_development_dependency 'rubygems-tasks'
end
