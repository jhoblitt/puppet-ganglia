# == Class: ganglia::params
#
# provides parameters for the ganglia module
#
# === Authors
#
# Joshua Hoblitt <jhoblitt@cpan.org>
#
# === Copyright
#
# Copyright (C) 2012-2013 Joshua Hoblitt
#

class ganglia::params {

  # files are the same for ubuntu and el5/el6
  $web_php_erb          = 'ganglia/conf.php.el6.erb'

  case $::osfamily {
    redhat: {
      $gmond_package_name   = 'ganglia-gmond'
      $gmond_service_name   = 'gmond'

      $gmetad_package_name  = 'ganglia-gmetad'
      $gmetad_service_name  = 'gmetad'
      $gmetad_user          = 'ganglia'

      # paths are the same for el5.x & el6.x
      $web_package_name     = 'ganglia-web'
      $web_php_config       = '/etc/ganglia/conf.php'

      case $::operatingsystemmajrelease {
        # the epel packages change uid/gids + install paths between 5 & 6
        5: {
          $gmond_service_config = '/etc/gmond.conf'
          $gmond_service_erb    = 'ganglia/gmond.conf.el5.erb'

          $gmetad_service_config = '/etc/gmetad.conf'
          # it looks like it's safe to use the same template for el5.x & el6.x
          $gmetad_service_erb    = 'ganglia/gmetad.conf.el6.erb'
        }
        # fedora is also part of $::osfamily = redhat so we shouldn't default
        # to failing on el7.x +
        # match 7 .. 99
        6, /^([7-9]|[1-9][0-9])$/: {
          $gmond_service_config = '/etc/ganglia/gmond.conf'
          $gmond_service_erb    = 'ganglia/gmond.conf.el6.erb'

          $gmetad_service_config = '/etc/ganglia/gmetad.conf'
          $gmetad_service_erb    = 'ganglia/gmetad.conf.el6.erb'
        }
        default: {
          fail("Module ${module_name} is not supported on operatingsystemmajrelease ${::operatingsystemmajrelease}")
        }
      }
    }
    debian: {
      case $::operatingsystem {
        ubuntu: {
          # I use ubuntu 12.04 and 13.04, have not tested others
          $gmond_package_name    = 'ganglia-monitor'
          $gmond_service_name    = 'ganglia-monitor'

          $gmetad_package_name   = 'gmetad'
          $gmetad_service_name   = 'gmetad'
          $gmetad_user           = 'nobody'

          $web_package_name      = 'ganglia-webfrontend'
          $web_php_config        = '/usr/share/ganglia-webfrontend/conf.php'

          $gmond_service_config  = '/etc/ganglia/gmond.conf'
          $gmond_service_erb     = 'ganglia/gmond.conf.ubuntu.erb'

          $gmetad_service_config = '/etc/ganglia/gmetad.conf'
          # it's the same file as el6 with only the default user comment changed
          $gmetad_service_erb    = 'ganglia/gmetad.conf.el6.erb'

          # ubuntu 12.10 and below didn't have a status command in the init script
          if ($::lsbmajdistrelease <= 12) {
            $gmond_status_command  = 'pgrep -u ganglia -f /usr/sbin/gmond'
            $gmetad_status_command = 'pgrep -u nobody -f /usr/sbin/gmetad'
          }
        }
        default: {
          fail("Module ${module_name} is not supported on osfamily/operatingsystem: ${::osfamily}/${::operatingsystem}")
        }
      }
    }

    default: {
      fail("Module ${module_name} is not supported on ${::operatingsystem}")
    }
  }
}
