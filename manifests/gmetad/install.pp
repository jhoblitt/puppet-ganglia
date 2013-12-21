# == Class: ganglia::gmetad::install
#
# installs the package that provides gmetad
#
# === Authors
#
# Joshua Hoblitt <jhoblitt@cpan.org>
#
# === Copyright
#
# Copyright (C) 2012-2013 Joshua Hoblitt
#

class ganglia::gmetad::install {

  package { $::ganglia::params::gmetad_package_name:
    ensure => present,
  }
}
