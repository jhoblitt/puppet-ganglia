# == Define: ganglia::gmond::module
#
# configures a module stanza for gmond
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
# name, language, enabled, path and params
define ganglia::gmond::module (
  $module_name = $name,
  $path = "${ganglia::params::module_path}/${module_name}.so",
  $enabled = undef,
  $language = undef,
  $params = undef,
  $param = undef,
) {
  include ::ganglia::params
  
  file { "${::ganglia::params::gmond_conf_d}/module_${name}.conf":
    content => template('ganglia/gmond/module.conf.erb'),
    mode    => '0644',
  }
}
