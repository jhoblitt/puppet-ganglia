# == Class: ganglia::vded::config
#
# installs the configuration file for vded
#
# === Authors
#
# Matthew Schmitt <mschmitt@sugarsync.com>
#
# === Copyright
#
# Copyright (C) 2013 Matthew Schmitt
#

class ganglia::vded::config inherits ganglia::vded {

  file { $vded_service_config:
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template($vded_service_erb),
    notify  => Class['ganglia::vded::service'],
  }
}
