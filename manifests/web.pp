# == Class: ganglia::web
#
# install and configure the ganglia web front end
#
# === Parameters
#
# All parameteres are optional.
#
# [*ganglia_ip*]
#   string - defaults to '127.0.0.1'
#
# [*ganglia_port*]
#   string - defaults to '8652'
#
#
# === Examples
#
#    class{ 'ganglia::web': }
#
#    class{ 'ganglia::web':
#      $ganglia_ip = '192.168.0.1',
#      $ganglia_port = 8652,
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

class ganglia::web(
  $ganglia_ip = '127.0.0.1',
  $ganglia_port = 8652,
) inherits ganglia::params {
  validate_string($ganglia_ip)
  if !(is_string($ganglia_port) or is_integer($ganglia_port)) {
    fail('$ganglia_port is not a string or integer.')
  }

  anchor{ 'ganglia::web::begin': } ->
  class{ 'ganglia::web::install': } ->
  class{ 'ganglia::web::config': } ->
  anchor{ 'ganglia::web::end': }
}
