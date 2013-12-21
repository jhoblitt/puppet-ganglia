# == Class: ganglia::gmetad::config
#
# installs the configuration file for gmetad
#
# === Authors
#
# Joshua Hoblitt <jhoblitt@cpan.org>
#
# === Copyright
#
# Copyright (C) 2012-2013 Joshua Hoblitt
#

class ganglia::gmetad::config {

  file { $::ganglia::params::gmetad_service_config:
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template($::ganglia::params::gmetad_service_erb),
    notify  => Class['ganglia::gmetad::service'],
  }
}
