class ganglia::gmond::install {
  include ganglia::params

  package { $ganglia::params::gmond_package_name:
    ensure => latest,
  }
}
