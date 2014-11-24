# == Class: ganglia::gmetad
#
# install and configure the ganglia gmetad daemon
#
# === Parameters
#
# All parameteres are optional.
#
# [*clusters*]
#   array of hashes.  Valid keys are:
#
#   -name
#   -polling_interval
#   -address
#
#   defaults to:
#   [ { name => 'my cluster', address => 'localhost' } ],
#
# [*gridname*]
#   string - defaults to '', which means no gridname at all
#
#
# === Examples
#
#
#    $clusters = [
#      {
#        name     => 'test',
#        address  => ['test1.example.org', 'test2.example.org'],
#      },
#    ]
#
#    class{ 'ganglia::gmetad':
#      clusters => $clusters,
#      gridname => 'my grid',
#    }
#
#
# === Authors
#
# Joshua Hoblitt <jhoblitt@cpan.org>
#
# === Copyright
#
# Copyright (C) 2012-2013 Joshua Hoblitt
#

class ganglia::gmetad(
  $clusters = [ { 'name' => 'my cluster', 'address' => 'localhost' } ],
  $gridname = undef,
  $rras = $ganglia::params::rras,
  $gmetad_package_name = $ganglia::params::gmetad_package_name,
  $gmetad_service_name = $ganglia::params::gmetad_service_name,
  $gmetad_service_config = $ganglia::params::gmetad_service_config,
  $gmetad_user = $ganglia::params::gmetad_user,
  $gmetad_case_sensitive_hostnames = $ganglia::params::gmetad_case_sensitive_hostnames
) inherits ganglia::params {
  ganglia_validate_clusters($clusters)
  validate_string($gridname)
  ganglia_validate_rras($rras)
  validate_string($gmetad_package_name)
  validate_string($gmetad_service_name)
  validate_string($gmetad_service_config)
  validate_string($gmetad_user)

  anchor{ 'ganglia::gmetad::begin': } ->
  class{ 'ganglia::gmetad::install': } ->
  class{ 'ganglia::gmetad::config': } ->
  class{ 'ganglia::gmetad::service': } ->
  anchor{ 'ganglia::gmetad::end': }
}
