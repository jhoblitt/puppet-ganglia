# == Class: ganglia::web::install
#
# installs the package that provides the ganglia web front end
#
# === Authors
#
# Joshua Hoblitt <jhoblitt@cpan.org>
#
# === Copyright
#
# Copyright (C) 2012-2013 Joshua Hoblitt
#

class ganglia::web::install {

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
}
