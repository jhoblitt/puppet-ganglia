# == Class: ganglia::web
#
class ganglia::web(
  $ganglia_ip   = '127.0.0.1',
  $ganglia_port = 8652,
) inherits ganglia::params {
  validate_string($ganglia_ip)
  if !(is_string($ganglia_port) or is_integer($ganglia_port)) {
    fail('$ganglia_port is not a string or integer.')
  }
  if (is_string($ganglia_port)) {
    warning('Passing a String to $ganglia_port is deprecated.  Please use an Integer value.')
  }

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

  Package[$::ganglia::params::web_package_name] ->
  file { $::ganglia::params::web_php_config:
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template($::ganglia::params::web_php_erb),
  }
}
