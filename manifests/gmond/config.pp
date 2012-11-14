class ganglia::gmond::config {

  file { $gmond_service_config:
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',  
    content => template($gmond_service_erb),
    notify  => Class["ganglia::gmond::service"],
  }
}
