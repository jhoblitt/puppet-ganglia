class ganglia::gmetad::service inherits ganglia::gmetad {

  service { $gmetad_service_name:
    ensure      => running,
    hasstatus   => true,
    hasrestart  => true,
    enable      => true,
  }
}
