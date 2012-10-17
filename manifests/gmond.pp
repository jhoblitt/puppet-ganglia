class ganglia::gmond {
  include ganglia::gmond::install, ganglia::gmond::config, ganglia::gmond::service, ganglia::params
}
