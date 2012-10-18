class ganglia::gmetad::config(
  $clusters,
  $gridname = false,
) {
  include ganglia::gmetad::install
  include ganglia::gmetad::service
  include ganglia::params
  include ganglia::config

  file { $ganglia::params::gmetad_service_config:
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',  
    content => template($ganglia::params::gmetad_service_erb),
    notify  => Class["ganglia::gmetad::service"],
    require => Class["ganglia::gmetad::install"],
  }
}
