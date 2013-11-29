# == Define: ganglia::gmond::udp_recv_channel
#
# configures a udp_recv_channel stanza for gmond
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
define ganglia::gmond::udp_recv_channel (
  $port,
  $mcast_join = undef,
  $bind       = undef,
  $mcast_if   = undef,
  $family     = undef,
) {
  include ::ganglia::params
  
  file { "${::ganglia::params::gmond_conf_d}/udp_recv_channel_${name}.conf":
    content => template('ganglia/gmond/udp_recv_channel.conf.erb'),
    mode    => '0644',
  }
}
