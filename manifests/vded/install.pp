# == Class: ganglia::vded::install
#
# installs the package that provides vded
#
# === Authors
#
# Matthew Schmitt <mschmitt@sugarsync.com>
#
# === Copyright
#
# Copyright (C) 2013 Matthew Schmitt
#

class ganglia::vded::install inherits ganglia::vded {

  package { $vded_package_name:
    ensure => present,
  }
}
