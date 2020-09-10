# @summary ganglia::web
#   Sets php web package and config for Ganglia
class ganglia::web (
  Stdlib::IP::Address $ganglia_ip   = '127.0.0.1',
  Integer             $ganglia_port = 8652,
) inherits ganglia::params {

  if versioncmp($::puppetversion, '3.6.0') > 0 {
    package { $::ganglia::params::web_package_name:
      ensure        => present,
      allow_virtual => false,
    }
  } else {
    package { $::ganglia::params::web_package_name:
      ensure => present,
    }
  }

  file { $::ganglia::params::web_php_config:
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template($::ganglia::params::web_php_erb),
    require => Package[$::ganglia::params::web_package_name]
  }
}
