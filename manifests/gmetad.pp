# == Class: ganglia::gmetad
#
# install and configure the ganglia gmetad daemon
#
# === Parameters
#
# All parameteres are optional.
#
# [*all_trusted*]
#   boolean, default false; if set to true, we will allow all hosts that
#   can query ganglia data via the xml query port.  Corresponds to the
#   'all_trusted' field in gmetad.conf.
#
# [*clusters*]
#   array of hashes.  Valid keys are:
#
#   -name
#   -polling_interval
#   -address
#
#   defaults to:
#   [ { name => 'my cluster', address => 'localhost' } ],
#
# [*gridname*]
#   string - defaults to '', which means no gridname at all
#
# [*trusted_hosts*]
#   array of strings, each of which matches a hostname that is allowed to
#   query ganglia data via the xml query port.  Corresponds to the
#   'trusted_hosts' field in gmetad.conf.
#
# === Examples
#
#
#    $clusters = [
#      {
#        name     => 'test',
#        address  => ['test1.example.org', 'test2.example.org'],
#      },
#    ]
#
#    class{ 'ganglia::gmetad':
#      clusters => $clusters,
#      gridname => 'my grid',
#    }
#
#
# === Authors
#
# Joshua Hoblitt <jhoblitt@cpan.org>
#
# === Copyright
#
# Copyright (C) 2012-2013 Joshua Hoblitt
#

class ganglia::gmetad(
  $all_trusted                     = false,
  $clusters                        = [
    { 'name' => 'my cluster', 'address' => 'localhost' },
  ],
  $gridname                        = undef,
  $rras                            = $::ganglia::params::rras,
  $trusted_hosts                   = [],
  $gmetad_package_name             = $::ganglia::params::gmetad_package_name,
  $gmetad_service_name             = $::ganglia::params::gmetad_service_name,
  $gmetad_service_config           = $::ganglia::params::gmetad_service_config,
  $gmetad_user                     = $::ganglia::params::gmetad_user,
  $gmetad_case_sensitive_hostnames =
    $::ganglia::params::gmetad_case_sensitive_hostnames
) inherits ganglia::params {
  validate_bool($all_trusted)
  ganglia_validate_clusters($clusters)
  validate_string($gridname)
  ganglia_validate_rras($rras)
  validate_array($trusted_hosts)
  validate_string($gmetad_package_name)
  validate_string($gmetad_service_name)
  validate_string($gmetad_service_config)
  validate_string($gmetad_user)

  if ($::ganglia::params::gmetad_status_command) {
    $hasstatus = false
  } else {
    $hasstatus = true
  }

  if versioncmp($::puppetversion, '3.6.0') > 0 {
    package { $::ganglia::params::gmetad_package_name:
      ensure        => present,
      allow_virtual => false,
    }
  } else {
    package { $::ganglia::params::gmetad_package_name:
      ensure => present,
    }
  }

  Package[$::ganglia::params::gmetad_package_name] ->
  file { $::ganglia::params::gmetad_service_config:
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template($::ganglia::params::gmetad_service_erb),
  } ~>
  service { $::ganglia::params::gmetad_service_name:
    ensure     => running,
    hasstatus  => $hasstatus,
    hasrestart => true,
    enable     => true,
    status     => $::ganglia::params::gmetad_status_command,
  }
}
