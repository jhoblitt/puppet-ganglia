class ganglia::gmetad::service {
  include ganglia::gmetad::config
  include ganglia::params

  service { $ganglia::params::gmetad_service_name:
    ensure      => running,
    hasstatus   => true,
    hasrestart  => true,
    enable      => true,
    require     => Class["ganglia::gmetad::config"],
  }
}
