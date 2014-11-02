# == Class: ganglia::gmond::install
#
# installs the package that provides gmond
#
# === Authors
#
# Joshua Hoblitt <jhoblitt@cpan.org>
#
# === Copyright
#
# Copyright (C) 2012-2013 Joshua Hoblitt
#

class ganglia::gmond::install {

  if versioncmp($::puppetversion, '3.6.0') > 0 {
    package { $::ganglia::params::gmond_package_name:
      ensure        => present,
      allow_virtual => false,
    }
  } else {
    package { $::ganglia::params::gmond_package_name:
      ensure => present,
    }
  }
}
