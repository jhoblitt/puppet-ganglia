class ganglia::web::install inherits ganglia::web {

  package { $web_package_name:
    ensure => present,
  }
}
