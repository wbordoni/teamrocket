require 'rbconfig'
# ruby 1.8.7 doesn't define RUBY_ENGINE
ruby_engine = defined?(RUBY_ENGINE) ? RUBY_ENGINE : 'ruby'
ruby_version = RbConfig::CONFIG["ruby_version"]
path = File.expand_path('..', __FILE__)
$:.unshift File.expand_path("#{path}/../gems/rake-10.4.2/lib")
$:.unshift File.expand_path("#{path}/../gems/capistrano-stats-1.1.1/lib")
$:.unshift File.expand_path("#{path}/../gems/i18n-0.7.0/lib")
$:.unshift File.expand_path("#{path}/../gems/colorize-0.7.5/lib")
$:.unshift File.expand_path("#{path}/../gems/net-ssh-2.9.2/lib")
$:.unshift File.expand_path("#{path}/../gems/net-scp-1.2.1/lib")
$:.unshift File.expand_path("#{path}/../gems/sshkit-1.6.1/lib")
$:.unshift File.expand_path("#{path}/../gems/capistrano-3.3.5/lib")
$:.unshift File.expand_path("#{path}/../gems/capitomcat-1.2.1/lib")
$:.unshift File.expand_path("#{path}/../gems/json-1.8.2-java/lib")
$:.unshift File.expand_path("#{path}/../gems/slop-3.0.4/lib")
$:.unshift File.expand_path("#{path}/../gems/jenkins-plugin-runtime-0.2.3/lib")
