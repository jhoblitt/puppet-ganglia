# == Class: ganglia::gmond
#
# install and configure the ganglia gmond daemon
#
# === Parameters
#
# All parameteres are optional.
#
# [*globals_deaf*]
#   string - defaults to "no"
#
# [*globals_host_dmax *]
#   string - defaults to "0"
#
# [*globals_send_metadata_interval*]
#   string - defaults to "300"
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
# [*host_location*]
#   string - defaults to "unspecified"
#
# [*udp_send_channel*]
#   array of hashes.  Valid keys are:
#
#   -bind_hostname
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
#   -family
#
#   defaults to:
#   [ { mcast_join => '239.2.11.71', port => 8649, ttl => 1 } ]
#
# [*tcp_accept_channel*]
#   array of hashes.  Valid keys are:
#
#   -port
#   -family
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
#      { bind_hostname => "yes", host => 'test3.example.org', ttl => 1 },
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
# Copyright (C) 2012-2014 Joshua Hoblitt
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

  anchor{ 'ganglia::gmond::begin': } ->
  class{ 'ganglia::gmond::install': } ->
  class{ 'ganglia::gmond::config': } ->
  class{ 'ganglia::gmond::service': } ->
  anchor{ 'ganglia::gmond::end': }
}
