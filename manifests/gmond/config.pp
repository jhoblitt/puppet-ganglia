# == Class: ganglia::gmond::config
#
# installs the configuration file for gmond
#
# === Authors
#
# Joshua Hoblitt <jhoblitt@cpan.org>
#
# === Copyright
#
# Copyright (C) 2012-2013 Joshua Hoblitt
#

class ganglia::gmond::config {

  file { $::ganglia::params::gmond_service_config:
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template($::ganglia::params::gmond_service_erb),
    notify  => Class['ganglia::gmond::service'],
  }
}
