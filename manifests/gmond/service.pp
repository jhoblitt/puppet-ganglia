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

class ganglia::gmond::service inherits ganglia::gmond{

  if ($gmond_status_command) {
    $hasstatus = false
  } else {
    $hasstatus = true
  }

  service { $gmond_service_name:
    ensure     => running,
    hasstatus  => $hasstatus,
    hasrestart => true,
    enable     => true,
    status     => $gmond_status_command,
  }
}
