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

  package { $::ganglia::params::web_package_name:
    ensure => present,
  }
}
