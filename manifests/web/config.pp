# == Class: ganglia::web::config
#
# configure the ganglia web front end
#
# === Authors
#
# Joshua Hoblitt <jhoblitt@cpan.org>
#
# === Copyright
#
# Copyright (C) 2012-2013 Joshua Hoblitt
#

class ganglia::web::config {

  file { $::ganglia::params::web_php_config:
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template($::ganglia::params::web_php_erb),
  }
}
