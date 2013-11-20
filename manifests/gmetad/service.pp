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

  if ($gmetad_status_command) {
    $hasstatus = false
  } else {
    $hasstatus = true
  }

  service { $gmetad_service_name:
    ensure     => running,
    hasstatus  => $hasstatus,
    hasrestart => true,
    enable     => true,
    status     => $gmetad_status_command,
  }
}
