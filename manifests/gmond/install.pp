class ganglia::gmond::install {

  package { $gmond_package_name:
    ensure => latest,
  }
}
