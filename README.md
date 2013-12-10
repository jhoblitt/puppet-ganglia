Puppet ganglia Module
=====================

[![Build Status](https://travis-ci.org/jhoblitt/puppet-ganglia.png)](https://travis-ci.org/jhoblitt/puppet-ganglia)

#### Table of Contents

1. [Overview](#overview)
2. [Description](#description)
3. [Usage](#usage)
    * [`ganglia::gmond`](#gangliagmond)
    * [`ganglia::gmetda`](#gangliagmetad)
    * [`ganglia::web`](#gangliaweb)
4. [Limitations](#limitations)
    * [Tested Platforms](#tested-platforms)
    * [`$::osfamily == RedHat` and EPEL packages](#osfamily--redhat-and-epel-packages)
5. [Support](#support)


Overview
--------

Install and configure the ganglia gmond & gmetad daemons + web front end

Description
-----------

This puppet module will install and configure the
[`ganglia`](http://ganglia.sourceforge.net/) `gmond` & `gmetad` daemons + web
front end.


Usage
-----

### ganglia::gmond

```puppet
    # unicast
    $udp_recv_channel = [
      { port => 8649, bind => 'localhost' },
      { port => 8649, bind => '0.0.0.0' },
    ]
    $udp_send_channel = [
      { port => 8649, host => 'test1.example.org', ttl => 2 },
      { port => 8649, host => 'test2.example.org', ttl => 2 },
    ]
    $tcp_accept_channel = [
      { port => 8649 },
    ]

    # multicast
    $udp_recv_channel = [
      { mcast_join => '239.2.11.71', port => 8649, ttl => 1 } 
    ]
    $udp_send_channel = [
      { mcast_join => '239.2.11.71', port => 8649, bind => '239.2.11.71' } 
    ]
    $tcp_accept_channel = [
      { port => 8649 },
    ]

    class{ 'ganglia::gmond':
      cluster_name       => 'example grid',
      cluster_owner      => 'ACME, Inc.',
      cluster_latlong    => 'N32.2332147 W110.9481163',
      cluster_url        => 'www.example.org',
      host_location      => 'example computer room',
      udp_recv_channel   => $udp_recv_channel,
      udp_send_channel   => $udp_send_channel,
      tcp_accept_channel => $tcp_accept_channel,
    }
```

### ganglia::gmetad

```puppet
    $clusters = [
      { 
        name     => 'test', 
        address  => ['test1.example.org', 'test2.example.org'],
      },
    ]

    class{ 'ganglia::gmetad':
      clusters => $clusters,   
      gridname => 'my grid',   
    }
```

### ganglia::web

```puppet
    class{ 'ganglia::web': }

    class{ 'ganglia::web':
      $ganglia_ip = '192.168.0.1',
      $ganglia_port = 8652,
    }
```

Limitations
-----------

### Tested Platforms

It has been tested on:

* el5.x
* el6.x
* ubuntu 12.04
* ubuntu 13.04

`$::osfamily == RedHat` and EPEL packages
-----------------------------------------

As of 2012-11-16, the stable EPEL repos for el5 and el6 contain, respectively,
packages for ganglia 3.0.7 and 3.1.7.  The ganglia UDP protocol for
communication between gmond daemons changed incompatibly between 3.0.x and
3.1.x.  However, the TCP based protocol gmetad uses to poll gmond agents has
remained compatible.

If it's desirable to stick with the EPEL packages, a possible way of dealing
with this is divide a group of hosts into two clusters based on
$::lsbmajdistrelease (which should imply gmond version without having to
install a custom fact).  The example below divides the previous "mycluster"
into "mycluster_el5" and "mycluster_el6".  Note that you will also have to
configure gmetad to pull a gmond agent from each of these new clusters.

```puppet
    $udp_recv_channel = [
      { port => 8649, bind => 'localhost' },
      { port => 8649, bind => '0.0.0.0' },
    ]
    case $::lsbmajdistrelease {
      5: {
        # epel for el5.x has 3.0.x, which will not work with gmond in 3.1.x
        $udp_send_channel = [
          { port => 8649, host => 'gmond-3-0_host1.example.org', ttl => 2 },
          { port => 8649, host => 'gmond-3-0_host2.example.org', ttl => 2 },
        ]
        $cluster_name = 'mycluster_el5'
      }
      6, default: {
        # epel for el6.x has 3.1.x
        $udp_send_channel = [
          { port => 8649, host => 'gmond-3-1_host1.example.org', ttl => 2 },
          { port => 8649, host => 'gmond-3-1_host2.example.org', ttl => 2 },
        ]
        $cluster_name = 'mycluster_el6'
      }
    }
    $tcp_accept_channel = [
      {port => 8649},
    ]

    class{ 'ganglia::gmond':
      cluster_name       => 'example grid',
      cluster_owner      => 'ACME, Inc.',
      cluster_latlong    => 'N32.2332147 W110.9481163',
      cluster_url        => 'www.example.org',
      host_location      => 'example computer room',
      udp_recv_channel   => $udp_recv_channel,
      udp_send_channel   => $udp_send_channel,
      tcp_accept_channel => $tcp_accept_channel,
    }
```

Support
-------

Please log tickets and issues at
[github](https://github.com/jhoblitt/puppet-ganglia/issues)


