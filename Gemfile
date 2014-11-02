source 'https://rubygems.org'

group :development, :test do
  gem 'rake',                   :require => false
  gem 'rspec-puppet',           :require => false
  # https://github.com/rodjek/puppet-lint/issues/331
  gem 'puppet-lint', '< 1.1.0', :require => false
  gem 'puppetlabs_spec_helper', :require => false
  gem 'serverspec',             :require => false
  gem 'beaker',                 :require => false
  gem 'beaker-rspec',           :require => false
  gem 'puppet-syntax',          :require => false
  gem 'pry',                    :require => false
end

if puppetversion = ENV['PUPPET_GEM_VERSION']
  gem 'puppet', puppetversion, :require => false
else
  gem 'puppet', :require => false
end

# vim:ft=ruby
