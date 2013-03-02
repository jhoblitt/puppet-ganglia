# == Class: ganglia::gmond::service
#
# enables the gmond service
#
# === Authors
#
# Joshua Hoblitt <jhoblitt@cpan.org>
#
# === Copyright
#
# Copyright (C) 2012-2013 Joshua Hoblitt
#

class ganglia::gmond::service {

  service { $gmond_service_name:
    ensure      => running,
    hasstatus   => true,
    hasrestart  => true,
    enable      => true,
  }
}
