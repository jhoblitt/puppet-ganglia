# 
# @summary ganglia::params
#   provides parameters for the ganglia module
#
class ganglia::params {

  # files are the same for ubuntu and el5/el6
  $web_php_erb          = 'ganglia/conf.php.el6.erb'

  $rras = [
    {
      cf      => 'AVERAGE',
      xff     => 0.5,
      steps   => 1,
      rows    => 5856
    },
    {
      cf      => 'AVERAGE',
      xff     => 0.5,
      steps   => 4,
      rows    => 20160
    },
    {
      cf      => 'AVERAGE',
      xff     => 0.5,
      steps   => 40,
      rows    => 52704
    },
  ]

  $gmetad_service_erb    = 'ganglia/gmetad.conf.erb'
  $default_gmetad_status  = 'pgrep -u ganglia -f /usr/sbin/gmetad'
  $default_gmond_status   = 'pgrep -u ganglia -f /usr/sbin/gmond'

  case $facts['osfamily'] {
    redhat: {
      $gmond_package_name   = 'ganglia-gmond'
      $gmond_service_name   = 'gmond'

      $gmetad_package_name  = 'ganglia-gmetad'
      $gmetad_service_name  = 'gmetad'

      # paths are the same for el5.x & el6.x
      $web_package_name     = 'ganglia-web'
      $web_php_config       = '/etc/ganglia/conf.php'

      case $facts['operatingsystem'] {
        'Fedora': {
          $gmond_service_config  = '/etc/ganglia/gmond.conf'
          $gmetad_user           = 'nobody'
          $gmond_service_erb     = 'ganglia/gmond.conf.el6.erb'

          $gmetad_service_config = '/etc/ganglia/gmetad.conf'

          $gmetad_hostnames_case = 0
          $gmetad_status_command = $default_gmetad_status
          $gmond_status_command  = $default_gmond_status
        }
        default: {
          case $facts['operatingsystemmajrelease'] {
            # the epel packages change uid/gids + install paths between 5 & 6
            '5': {
              $gmond_service_config   = '/etc/ganglia/gmond.conf'
              $gmetad_user            = 'ganglia'
              $gmond_service_erb      = 'ganglia/gmond.conf.el5.erb'

              $gmetad_service_config  = '/etc/ganglia/gmetad.conf'

              $gmetad_hostnames_case  = 0
              $gmond_status_command   = $default_gmond_status
              $gmetad_status_command  = $default_gmetad_status
            }
            '6', '7', '8': {
              $gmond_service_config = '/etc/ganglia/gmond.conf'
              $gmetad_user          = 'ganglia'
              $gmond_service_erb    = 'ganglia/gmond.conf.el6.erb'

              $gmetad_service_config  = '/etc/ganglia/gmetad.conf'

              $gmetad_hostnames_case  = 0
              $gmetad_status_command  = $default_gmetad_status
              $gmond_status_command   = $default_gmond_status
            }
            default: {
              fail("Module ${module_name} is not supported on operatingsystemmajrelease ${::operatingsystemmajrelease}") # lint:ignore:140chars
            }
          }
        }
      }
    }
    debian: {
      $gmond_package_name    = 'ganglia-monitor'
      $gmond_service_name    = 'ganglia-monitor'

      $gmetad_package_name   = 'ganglia-gmetad'
      $gmetad_service_name   = 'gmetad'
      $gmetad_user           = 'nobody'

      $web_package_name      = 'ganglia-webfrontend'
      $web_php_config        = '/usr/share/ganglia-webfrontend/conf.php'

      $gmond_service_config  = '/etc/ganglia/gmond.conf'
      $gmond_service_erb     = 'ganglia/gmond.conf.debian.erb'

      $gmetad_service_config = '/etc/ganglia/gmetad.conf'

      $gmetad_hostnames_case = 1

      $gmond_status_command  = 'pgrep -u ganglia -f /usr/sbin/gmond'
      $gmetad_status_command = 'pgrep -u nobody -f /usr/sbin/gmetad'
    }
    default: {
      fail("Module ${module_name} is not supported on ${facts['operatingsystem']}")
    }
  }
}
