# == Class: ganglia::gmetad::service
#
# enables the gmetad service
#
# === Authors
#
# Joshua Hoblitt <jhoblitt@cpan.org>
#
# === Copyright
#
# Copyright (C) 2012-2013 Joshua Hoblitt
#

class ganglia::gmetad::service inherits ganglia::gmetad {

  service { $gmetad_service_name:
    ensure      => running,
    hasstatus   => true,
    hasrestart  => true,
    enable      => true,
  }
}
