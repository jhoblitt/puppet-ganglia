class ganglia::gmetad::install {
  include ganglia::params

  package { $ganglia::params::gmetad_package_name:
    ensure => latest,
  }
}
