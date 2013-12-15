# == Class: ganglia::gmond
#
# install and configure the ganglia gmond daemon
#
# === Parameters
#
# All parameteres are optional.
#
# [*cluster_name*]
#   string - defaults to "unspecified"
#
# [*cluster_owner*]
#   string - defaults to "unspecified"
#
# [*cluster_latlong*]
#   string - defaults to "unspecified"
#
# [*cluster_url*]
#   string - defaults to "unspecified"
#
# [*host_dmax*]
#   integer - defaults to 0
#
# [*host_location*]
#   string - defaults to "unspecified"
#
# [*send_metadata_interval*]
#   integer - defaults to 300
#
# [*udp_send_channel*]
#   array of hashes.  Valid keys are:
#
#   -mcast_join
#   -host
#   -port
#   -ttl
#
#   defaults to:
#   [ { mcast_join => '239.2.11.71', port => 8649, bind => '239.2.11.71' } ]
#
# [*udp_recv_channel*]
#   array of hashes.  Valid keys are:
#
#   -channel
#   -mcast_join
#   -port
#   -bind
#
#   defaults to:
#   [ { mcast_join => '239.2.11.71', port => 8649, ttl => 1 } ]
#
# [*tcp_accept_channel*]
#   array of hashes.  Valid keys are:
#
#   -port
#
#   defaults to:
#   [ { port => 8659 } ]
#
#
# === Examples
#
#    $udp_recv_channel = [
#      { port => 8649, bind => 'localhost' },
#      { port => 8649, bind => '0.0.0.0' },
#    ]
#    $udp_send_channel = [
#      { port => 8649, host => 'test1.example.org', ttl => 2 },
#      { port => 8649, host => 'test2.example.org', ttl => 2 },
#    ]
#    $tcp_accept_channel = [
#      { port => 8649 },
#    ]
#
#    class{ 'ganglia::gmond':
#      cluster_name       => 'example grid',
#      cluster_owner      => 'ACME, Inc.',
#      cluster_latlong    => 'N32.2332147 W110.9481163',
#      cluster_url        => 'www.example.org',
#      host_location      => 'example computer room',
#      udp_recv_channel   => $udp_recv_channel,
#      udp_send_channel   => $udp_send_channel,
#      tcp_accept_channel => $tcp_accept_channel,
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

class ganglia::gmond (
  $cluster_name           = 'unspecified',
  $cluster_owner          = 'unspecified',
  $cluster_latlong        = 'unspecified',
  $cluster_url            = 'unspecified',
  $host_dmax              = '0',
  $host_location          = 'unspecified',
  $send_metadata_interval = '300',
  $udp_send_channel       = [
    { mcast_join          => '239.2.11.71', port => 8649, ttl => 1 }
  ],
  $udp_recv_channel   = [
    { mcast_join => '239.2.11.71', port => 8649, bind => '239.2.11.71' }
  ],
  $tcp_accept_channel = [ { port => 8659 } ],
) inherits ganglia::params {
  validate_string($cluster_name, 'unspecified')
  validate_string($cluster_owner, 'unspecified')
  validate_string($cluster_latlong, 'unspecified')
  validate_string($cluster_url, 'unspecified')
  validate_string($host_dmax, '0')
  validate_string($host_location, 'unspecified')
  validate_string($send_metadata_interval, '300')
  validate_array($udp_send_channel)
  validate_array($udp_recv_channel)
  validate_array($tcp_accept_channel)

  anchor{ 'ganglia::gmond::begin': } ->
  class{ 'ganglia::gmond::install': } ->
  class{ 'ganglia::gmond::config': } ->
  class{ 'ganglia::gmond::service': } ->
  anchor{ 'ganglia::gmond::end': }
}
