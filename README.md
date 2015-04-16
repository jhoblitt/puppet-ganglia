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
5. [Versioning](#versioning)
6. [Support](#support)
7. [See Also](#see-also)


Overview
--------

Manages ganglia gmond & gmetad daemons + web front end


Description
-----------

This is a puppet module for installation and configuration of the
[`ganglia`](http://ganglia.sourceforge.net/) `gmond` & `gmetad` daemons + web
front end.


Usage
-----

### `ganglia::gmond`

This class manages the configurtion of the Ganglia `gmond` daemon.

```puppet
    # unicast
    $udp_recv_channel = [
      { port => 8649, bind => 'localhost' },
      { port => 8649, bind => '0.0.0.0' },
    ]
    $udp_send_channel = [
      { port => 8649, host => 'test1.example.org', ttl => 2 },
      { port => 8649, host => 'test2.example.org', ttl => 2 },
      { bind_hostname => "yes", host => 'test3.example.org', ttl => 1 },
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
      globals_deaf                   => 'yes',
      globals_host_dmax              => '691200',
      globals_send_metadata_interval => '60',
      globals_override_hostname      => 'web.example.org',
      cluster_name                   => 'example grid',
      cluster_owner                  => 'ACME, Inc.',
      cluster_latlong                => 'N32.2332147 W110.9481163',
      cluster_url                    => 'www.example.org',
      host_location                  => 'example computer room',
      udp_recv_channel               => $udp_recv_channel,
      udp_send_channel               => $udp_send_channel,
      tcp_accept_channel             => $tcp_accept_channel,
    }
```

 * `globals_deaf`

  `String` defaults to: `no`

 * `globals_host_dmax`

  `String` defaults to: `0`

 * `globals_send_metadata_interval`

  `String` defaults to: `300`

 * `globals_override_hostname`

  `String` defaults to: undef

 * `cluster_name`

    `String` defaults to: `unspecified`

 * `cluster_owner`

    `String` defaults to: `unspecified`

 * `cluster_latlong`

    `String` defaults to: `unspecified`

 * `cluster_url`

    `String` defaults to: `unspecified`

 * `host_location`

    `String` defaults to: `unspecified`

 * `udp_send_channel`

    `Array of Hash` defaults to:

        [ { mcast_join => '239.2.11.71', port => 8649, ttl => 1 } ]

 * `udp_recv_channel`

    `Array of Hash` defaults to:

         [ { mcast_join => '239.2.11.71', port => 8649, bind => '239.2.11.71' } ]

 * `tcp_accept_channel`

    `Array of Hash` defaults to:

        [ { port => 8659 } ]

### ganglia::gmetad

```puppet
    $clusters = [
      {
        name     => 'test',
        address  => ['test1.example.org', 'test2.example.org'],
      },
    ]

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


      clusters      => $clusters,
      gridname      => 'my grid',
      rras          => $rras,
      all_trusted   => false,
      trusted_hosts => []
    }
```

 * `all_trusted`

    `Boolean` defaults to: false

    * If set to true, we will allow all hosts that can query ganglia data via the xml query port.  Corresponds to the 'all\_trusted' field in gmetad.conf.

 * `clusters`

    `Array of Hash` defaults to:

        [ { 'name' => 'my cluster', 'address' => 'localhost' } ]

 * `gridname`

    `String` defaults to: `undef`

 * `rras`

    `Array of Hash` defaults to:

    ```
      [
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
    ```

    * consolidation function (cf) can be AVERAGE | MIN | MAX | LAST
    * xfiles factor (xff) defines what part of a consolidation interval may be made up from *UNKNOWN* data while the consolidated value is still regarded as known. It is given as the ratio of allowed *UNKNOWN* PDPs to the number of PDPs in the interval. Thus, it ranges from 0 to 1 (exclusive).
    * steps defines how many of these primary data points are used to build a consolidated data point which then goes into the archive.
    * rows defines how many generations of data values are kept in an RRA. Obviously, this has to be greater than zero.

 * `trusted_hosts`

    `Array of Strings` defaults to empty array

    * Each string matches a hostname that is allowed to query ganglia data via the xml query port.  Corresponds to the 'trusted\_hosts' field in gmetad.conf.

### ganglia::web

```puppet
    class{ 'ganglia::web': }

    class{ 'ganglia::web':
      ganglia_ip   => '192.168.0.1',
      ganglia_port => 8652,
    }
```

 * `ganglia_ip`

    `String` defaults to: `127.0.0.1`

 * `ganglia_port`

    `String` defaults to: `8652`


Limitations
-----------

### Tested Platforms

It has been tested on:

* el5.x
* el6.x
* ubuntu 12.04
* ubuntu 13.04
* debian 6.07

### `$::osfamily == RedHat` and EPEL packages

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


Versioning
----------

This module is versioned according to the [Semantic Versioning
2.0.0](http://semver.org/spec/v2.0.0.html) specification.


Support
-------

Please log tickets and issues at
[github](https://github.com/jhoblitt/puppet-ganglia/issues)


See Also
--------

 * [Ganglia](http://ganglia.sourceforge.net/)

