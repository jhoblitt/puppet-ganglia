class ganglia::gmond (
  $cluster_name       = 'unspecified',
  $cluster_owner      = 'unspecified',
  $cluster_latlong    = 'unspecified',
  $cluster_url        = 'unspecified',
  $host_location      = 'unspecified',
  $udp_send_channel   = [
    { mcast_join => '239.2.11.71', port => 8649, ttl => 1 }
  ],
  $udp_recv_channel   = [
    { mcast_join => '239.2.11.71', port => 8649, bind => '239.2.11.71' }
  ],
  $tcp_accept_channel = [ { port => 8659 } ],
) inherits ganglia::params {
  validate_string($cluster_name)
  validate_string($cluster_owner)
  validate_string($cluster_latlong)
  validate_string($cluster_lurl)
  validate_string($cluster_location)
  validate_array($udp_recv_channel)
  validate_array($udp_send_channel)
  validate_array($tcp_accept_channel)

  class{ 'ganglia::gmond::install': } ->
  class{ 'ganglia::gmond::config': } ->
  class{ 'ganglia::gmond::service': } ->
  Class[ 'ganglia::gmond']
}
