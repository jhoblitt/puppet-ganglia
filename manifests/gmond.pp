# == Class: ganglia::gmond
#
class ganglia::gmond (
  $globals_deaf                   = 'no',
  $globals_host_dmax              = '0',
  $globals_send_metadata_interval = '300',
  $globals_override_hostname      = undef,
  $cluster_name                   = 'unspecified',
  $cluster_owner                  = 'unspecified',
  $cluster_latlong                = 'unspecified',
  $cluster_url                    = 'unspecified',
  $host_location                  = 'unspecified',
  $udp_send_channel               = [
    { mcast_join => '239.2.11.71', port => 8649, ttl => 1 }
  ],
  $udp_recv_channel               = [
    { mcast_join => '239.2.11.71', port => 8649, bind => '239.2.11.71' }
  ],
  $tcp_accept_channel             = [ { port => 8659 } ],
  $gmond_package_name             = $::ganglia::params::gmond_package_name,
) inherits ganglia::params {
  validate_string($globals_deaf)
  validate_string($globals_host_dmax)
  validate_string($globals_send_metadata_interval)
  if $globals_override_hostname {
    validate_string($globals_override_hostname)
  }
  validate_string($cluster_name)
  validate_string($cluster_owner)
  validate_string($cluster_latlong)
  validate_string($cluster_url)
  validate_string($host_location)
  validate_array($udp_send_channel)
  validate_array($udp_recv_channel)
  validate_array($tcp_accept_channel)
  if !(is_string($gmond_package_name) or is_array($gmond_package_name)) {
    fail('$gmond_package_name is not a string or array.')
  }

  if ($::ganglia::params::gmond_status_command) {
    $hasstatus = false
  } else {
    $hasstatus = true
  }

  if versioncmp($::puppetversion, '3.6.0') > 0 {
    package { $gmond_package_name:
      ensure        => present,
      allow_virtual => false,
    }
  } else {
    package { $gmond_package_name:
      ensure => present,
    }
  }

  Package[$gmond_package_name] ->
  file { $::ganglia::params::gmond_service_config:
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template($::ganglia::params::gmond_service_erb),
  } ~>
  service { $::ganglia::params::gmond_service_name:
    ensure     => running,
    hasstatus  => $hasstatus,
    hasrestart => true,
    enable     => true,
    status     => $::ganglia::params::gmond_status_command,
  }
}
