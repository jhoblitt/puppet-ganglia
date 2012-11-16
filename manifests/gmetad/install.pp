class ganglia::gmetad::install inherits ganglia::gmetad {

  package { $gmetad_package_name:
    ensure => present,
  }
}
