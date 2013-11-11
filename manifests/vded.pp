# == Class: ganglia::vded
#
# install and configure the ganglia vded daemon
#
# More Info: https://github.com/jbuchbinder/vded
#
# === Parameters
#
# All parameteres are optional.
#
# [*port*]
#   integer - defaults to 48333
#
# [*ghosts*]
#   array of hashes.  Valid keys are:
#
#   -host
#
#   defaults to:
#   [ { host => '$::hostname' } ]
#
# === Examples
#
#    $ghosts = [
#      { host => app01},
#      { host => app02},
#    ]
#
#    class{ 'ganglia::vded':
#      ghosts => $ghosts,
#    }
#
#
# === Authors
#
# Matthew Schmitt <mschmitt@sugarsync.com>
#
# === Copyright
#
# Copyright (C) 2013 Matthew Schmitt
#

class ganglia::vded (
  $port = '48333',
  $ghosts = [
    { host => "${::hostname}" }
    ],
) inherits ganglia::params {
  validate_array($ghosts)

  class{ 'ganglia::vded::install': } ->
  class{ 'ganglia::vded::config': } ->
  class{ 'ganglia::vded::service': } ->
  Class[ 'ganglia::vded']
}
