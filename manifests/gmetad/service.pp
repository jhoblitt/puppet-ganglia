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

class ganglia::gmetad::service {

  if ($::ganglia::params::gmetad_status_command) {
    $hasstatus = false
  } else {
    $hasstatus = true
  }

  service { $::ganglia::params::gmetad_service_name:
    ensure     => running,
    hasstatus  => $hasstatus,
    hasrestart => true,
    enable     => true,
    status     => $::ganglia::params::gmetad_status_command,
  }
}
