# == Class: ganglia::vded::service
#
# enables the gmond service
#
# === Authors
#
# Matthew Schmitt <mschmitt@sugarsync.com>
#
# === Copyright
#
# Copyright (C) 2013 Matthew Schmitt
#

class ganglia::vded::service inherits ganglia::vded{

  service { $vded_service_name:
    ensure      => running,
    hasstatus   => false,
    hasrestart  => false,
    enable      => true,
  }
}
