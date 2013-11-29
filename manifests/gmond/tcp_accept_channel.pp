# == Define: ganglia::gmond::tcp_accept_channel
#
# configures a tcp_accept_channel stanza for gmond
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
define ganglia::gmond::tcp_accept_channel (
  $port,
  $bind    = undef,
  $family  = undef,
  $timeout = undef,
) {
  include ::ganglia::params
  
  file { "${::ganglia::params::gmond_conf_d}/tcp_accept_channel_${name}.conf":
    content => template('ganglia/gmond/tcp_accept_channel.conf.erb'),
    mode    => '0644',
  }
}
