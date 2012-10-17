class ganglia::config {
  include ganglia::params

  user {'ganglia':
#    uid     => $ganglia::params::ganglia_uid,
    gid     => 'ganglia',
    comment => 'Ganglia Monitoring System',
    home    => '/var/lib/ganglia',
    managehome => false,
    shell   => '/sbin/nologin',
    require => Group['ganglia'],
  }

  group {'ganglia':
#    gid => $ganglia::params::ganglia_gid,
  }
}
