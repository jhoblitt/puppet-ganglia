class ganglia::params {
  $gmond_package_name   = 'ganglia-gmond'
  $gmond_service_name   = 'gmond'

  $gmetad_package_name   = 'ganglia-gmetad'
  $gmetad_service_name   = 'gmetad'

  case $lsbmajdistrelease {
    # the epel packages change uid/gids + install paths between 5 & 6
    5: {
      $ganglia_uid = 298
      $ganglia_gid = 298
      $gmond_service_config = '/etc/gmond.conf'
      $gmond_service_erb    = 'ganglia/gmond.conf.el5.erb'

      $gmetad_service_config = '/etc/gmetad.conf'
      $gmetad_service_erb    = 'ganglia/gmetad.conf.el5.erb'
    }
    6: {
      $ganglia_uid = 211
      $ganglia_gid = 211
      $gmond_service_config = '/etc/ganglia/gmond.conf'
      $gmond_service_erb    = 'ganglia/gmond.conf.el6.erb'

      $gmetad_service_config = '/etc/ganglia/gmetad.conf'
      $gmetad_service_erb    = 'ganglia/gmetad.conf.el6.erb'
    }
  }
}
