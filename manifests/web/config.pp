class ganglia::web::config inherits ganglia::web {

  file { $web_php_config:
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',  
    content => template($web_php_erb),
  }
}
