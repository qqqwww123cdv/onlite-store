# -*- encoding: utf-8 -*-
# stub: select_all-rails 0.3.2 ruby lib

Gem::Specification.new do |s|
  s.name = "select_all-rails".freeze
  s.version = "0.3.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Jignesh Satam".freeze]
  s.bindir = "exe".freeze
  s.date = "2017-09-06"
  s.description = "Simple to select all checkboxes.".freeze
  s.email = ["jigneshsatam@gmail.com".freeze]
  s.homepage = "https://github.com/JigneshSatam/select_all-rails".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.1.2".freeze
  s.summary = "Simple to select all checkboxes.".freeze

  s.installed_by_version = "3.1.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_development_dependency(%q<bundler>.freeze, ["~> 1.8"])
    s.add_development_dependency(%q<rake>.freeze, ["~> 10.0"])
  else
    s.add_dependency(%q<bundler>.freeze, ["~> 1.8"])
    s.add_dependency(%q<rake>.freeze, ["~> 10.0"])
  end
end
