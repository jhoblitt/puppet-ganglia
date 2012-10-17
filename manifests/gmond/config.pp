class ganglia::gmond::config(
  $cluster_name,
  $cluster_owner,
  $cluster_latlong,
  $cluster_url,
  $host_location,
  $udp_recv_channel,
  $udp_send_channel,
  $tcp_accept_channel
) {
  include ganglia::gmond::install
  include ganglia::gmond::service
  include ganglia::params
  include ganglia::config

  file { $ganglia::params::gmond_service_config:
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',  
    content => template($ganglia::params::gmond_service_erb),
    notify  => Class["ganglia::gmond::service"],
    require => Class["ganglia::gmond::install"],
  }
}
