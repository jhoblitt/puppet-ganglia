# == Class: ganglia::gmond::service
# # enables the gmond service
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

  if ($::ganglia::params::gmond_status_command) {
    $hasstatus = false
  } else {
    $hasstatus = true
  }

  service { $::ganglia::params::gmond_service_name:
    ensure     => running,
    hasstatus  => $hasstatus,
    hasrestart => true,
    enable     => true,
    status     => $::ganglia::params::gmond_status_command,
  }
}
