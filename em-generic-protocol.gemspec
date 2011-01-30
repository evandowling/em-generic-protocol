# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{em-generic-protocol}
  s.version = "0.0.1"
  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Evan Dowling"]
  s.date = %q{2011-01-30}
  s.description = %q{This gem provides Ruby boiler plate code for implementing TCP protocols in Ruby\'s EventMachine in the <prefix><message length><message> paradigm.'}
  s.email = %q{dowling.evan@gmail.com}
  s.extensions = []
  s.files = ["lib/generic_protocol.rb","em-generic-protocol.gemspec"]
  s.add_dependency('eventmachine', '>= 0.12.10')
  s.homepage = %q{http://github.com/evandowling/em-generic-protocol}
  s.require_paths = ["lib"]
  s.summary = %q{a base class in Ruby for implementing tcp protocols in event machine}
  s.test_files = []
end