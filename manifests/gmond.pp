class ganglia::gmond (
  $cluster_name,
  $cluster_owner,
  $cluster_latlong,
  $cluster_url,
  $host_location,
  $udp_recv_channel,
  $udp_send_channel,
  $tcp_accept_channel
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
