# -*- encoding: utf-8 -*-
# stub: capitomcat 1.2.1 ruby lib

Gem::Specification.new do |s|
  s.name = "capitomcat"
  s.version = "1.2.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Sunggun Yu"]
  s.date = "2015-01-25"
  s.description = "Capitomcat is the Capistrano 3 recipe for Tomcat web application deployment."
  s.email = ["sunggun.dev@gmail.com"]
  s.homepage = "http://sunggun-yu.github.io/capitomcat/"
  s.licenses = ["Apache 2.0"]
  s.require_paths = ["lib"]
  s.rubygems_version = "2.1.9"
  s.summary = "Capistrano 3 recipe for Tomcat web application deployment"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<capistrano>, [">= 3.3.5", "~> 3.3"])
    else
      s.add_dependency(%q<capistrano>, [">= 3.3.5", "~> 3.3"])
    end
  else
    s.add_dependency(%q<capistrano>, [">= 3.3.5", "~> 3.3"])
  end
end
