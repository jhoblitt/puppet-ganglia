# == Define: ganglia::gmond::udp_send_channel
#
# configures a udp_send_channel stanza for gmond
#
# === Authors
#
# Jeremy Kitchen <kitchen@kitchen.io>
#
# === Copyright
#
# Copyright (C) 2013 3DNA Corp
#
#
define ganglia::gmond::udp_send_channel (
  $port,
  $mcast_join    = undef,
  $mcast_if      = undef,
  $host          = undef,
  $ttl           = undef,
  $bind          = undef,
  $bind_hostname = undef,
) {
  include ::ganglia::params
  
  file { "${::ganglia::params::gmond_conf_d}/${name}.conf":
    content => template('ganglia/gmond/udp_send_channel.conf.erb'),
    mode    => '0644',
  }
}
