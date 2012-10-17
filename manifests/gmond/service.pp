class ganglia::gmond::service {
  include ganglia::gmond::config
  include ganglia::params

  service { $ganglia::params::gmond_service_name:
    ensure      => running,
    hasstatus   => true,
    hasrestart  => true,
    enable      => true,
    require     => Class["ganglia::gmond::config"],
  }
}
