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
  $gmond_package_name   = 'ganglia-gmond'
  $gmond_service_name   = 'gmond'

  $gmetad_package_name  = 'ganglia-gmetad'
  $gmetad_service_name  = 'gmetad'

  # paths are the same for el5.x & el6.x
  $web_package_name     = 'ganglia-web'
  $web_php_config       = '/etc/ganglia/conf.php'
  $web_php_erb          = 'ganglia/conf.php.el6.erb'

  group { 'ganglia':
    ensure => 'present',
    system => true,
  }
  user { 'ganglia':
    ensure  => 'present',
    comment => 'Ganglia Monitoring System',
    gid     => 'ganglia',
    shell   => '/sbin/nologin',
    system  => true,
  }
  case $::osfamily {
    redhat: {
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
    default: {
      fail("Module ${module_name} is not supported on ${::operatingsystem}")
    }
  }
}
