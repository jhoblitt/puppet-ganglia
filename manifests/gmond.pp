# @summary ganglia::gmond
#   Manages ganglia gmond & gmetad daemons + web front end
#
# @param globals_deaf
# @param globals_host_dmax
# @param globals_send_metadata_interval
# @param globals_override_hostname
# @param globals_user
# @param globals_max_udp_msg_len
# @param cluster_name
# @param cluster_owner
# @param cluster_latlong
# @param cluster_url
# @param host_location
# @param udp_send_channel
# @param udp_recv_channel
# @param tcp_accept_channel
# @param gmond_package_name
# @param gmond_package_ensure
# @param gmond_service_name
# @param gmond_service_config
# @param gmond_status_command
#
# @see https://puppet.com/docs/puppet/6.17/style_guide.html#parameter-defaults
# @see https://puppet.com/docs/puppet/6.17/hiera_migrate.html#module_data_params
#
class ganglia::gmond (
  String $globals_deaf                              = 'no',
  String $globals_host_dmax                         = '0',
  String $globals_send_metadata_interval            = '300',
  Optional[Stdlib::Fqdn] $globals_override_hostname = undef,
  String $globals_user                              = 'ganglia',
  Integer $globals_max_udp_msg_len                  = 1472,
  String $cluster_name                              = 'unspecified',
  String $cluster_owner                             = 'unspecified',
  String $cluster_latlong                           = 'unspecified',
  Optional[Stdlib::Fqdn] $cluster_url               = undef,
  String $host_location                             = 'unspecified',
  Array[Hash] $udp_send_channel                     = [{ mcast_join => '239.2.11.71', port => 8649, ttl => 1 }],
  Array[Hash] $udp_recv_channel                     = [{ mcast_join => '239.2.11.71', port => 8649, bind => '239.2.11.71' }],
  Array[Hash] $tcp_accept_channel                   = [{ port => 8659 }],
  Variant[String, Tuple] $gmond_package_name        = $ganglia::params::gmond_package_name,
  String $gmond_package_ensure                      = 'present',
  String $gmond_service_name                        = $ganglia::params::gmond_service_name,
  String $gmond_service_config                      = $ganglia::params::gmond_service_config,
  String $gmond_status_command                      = $ganglia::params::gmond_status_command,
) inherits ganglia::params {
  if ($ganglia::params::gmond_status_command) {
    $hasstatus = false
  } else {
    $hasstatus = true
  }

  package { $gmond_package_name:
    ensure => $gmond_package_ensure,
    notify => Service[$gmond_service_name],
  }

  file { $gmond_service_config:
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template($ganglia::params::gmond_service_erb),
    require => Package[$gmond_package_name],
    notify  => Service[$gmond_service_name],
  }
  service { $gmond_service_name:
    ensure     => running,
    hasstatus  => $hasstatus,
    hasrestart => true,
    enable     => true,
    status     => $gmond_status_command,
  }
}
