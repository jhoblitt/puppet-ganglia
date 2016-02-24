Puppet ganglia Module
=====================

[![Build Status](https://travis-ci.org/jhoblitt/puppet-ganglia.png)](https://travis-ci.org/jhoblitt/puppet-ganglia)

#### Table of Contents

1. [Overview](#overview)
2. [Description](#description)
3. [Usage](#usage)
    * [Examples](#examples)
    * [Classes](#classes)
        * [`ganglia::gmond`](#gangliagmond)
        * [`ganglia::gmetda`](#gangliagmetad)
        * [`ganglia::web`](#gangliaweb)
4. [Limitations](#limitations)
    * [Tested Platforms](#tested-platforms)
    * [Puppet Version Compatibility](#puppet-version-compatibility)
    * [`$::osfamily == RedHat` and EPEL packages](#osfamily--redhat-and-epel-packages)
5. [Versioning](#versioning)
6. [Support](#support)
7. [Contributing](#contributing)
8. [See Also](#see-also)


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

### Examples

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
    { mcast_join => '239.2.11.71', mcast_if => 'eth0', port => 8649, ttl => 1 }
  ]
  $udp_send_channel = [
    { mcast_join => '239.2.11.71', port => 8649, bind => '239.2.11.71' }
  ]
  $tcp_accept_channel = [
    { port => 8649 },
  ]

  $gmond_package_name = [ 'ganglia-gmond', 'ganglia-gmond-python' ]

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
    gmond_package_name             => $gmond_package_name,
  }
```

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

  class { 'ganglia::gmetad':
    clusters      => $clusters,
    gridname      => 'my grid',
    rras          => $rras,
    all_trusted   => false,
    trusted_hosts => [],
  }
```

```puppet
  class{ 'ganglia::web':
    ganglia_ip => '192.168.0.1',
    ganglia_port => 8652,
  }
```

### Classes

#### `ganglia::gmond`

This class manages the configurtion of the Ganglia `gmond` daemon.

```puppet
# defaults
class { 'ganglia::gmond':
  globals_deaf                     => 'no',
  globals_host_dmax                =>'0',
  globals_send_metadata_interval   => '300',
  globals_override_hostname        => undef,
  cluster_name                     => 'unspecified',
  cluster_owner                    => 'unspecified',
  cluster_latlong                  => 'unspecified',
  cluster_url                      => 'unspecified',
  host_location                    => 'unspecified',
  udp_send_channel                 => [
    { mcast_join => '239.2.11.71', port => 8649, ttl => 1 }
  ],
  udp_recv_channel                 => [
    { mcast_join => '239.2.11.71', port => 8649, bind => '239.2.11.71' }
  ],
  tcp_accept_channel               => [ { port => 8659 } ],
  gmond_package_name               => $::ganglia::params::gmond_package_name,
}
```

##### `globals_deaf`

`String` defaults to: `no`

##### `globals_host_dmax`

`String` defaults to: `0`

##### `globals_send_metadata_interval`

`String` defaults to: `300`

##### `globals_override_hostname`

`String` defaults to: `undef`

##### `cluster_name`

`String` defaults to: `unspecified`

##### `cluster_owner`

`String` defaults to: `unspecified`

##### `cluster_latlong`

`String` defaults to: `unspecified`

##### `cluster_url`

`String` defaults to: `unspecified`

##### `host_location`

`String` defaults to: `unspecified`

##### `udp_send_channel`

`Array of Hash` defaults to:

    [ { mcast_join => '239.2.11.71', port => 8649, ttl => 1 } ]

Supported hash keys are (all optional):

* `bind_hostname`
* `mcast_join`
* `mcast_if`
* `host`
* `port`
* `ttl`

##### `udp_recv_channel`

`Array of Hash` defaults to:

    { mcast_join => '239.2.11.71', port => 8649, bind => '239.2.11.71' } ]

Supported hash keys are (all optional):

* `mcast_join`
* `mcast_if`
* `port`
* `bind`
* `family`

##### `tcp_accept_channel`

`Array of Hash` defaults to:

    [ { port => 8659 } ]

Supported hash keys are (all optional):

* `port`
* `family`

##### `gmond_package_name`

`String or Array` defaults to: `$::ganglia::params::gmond_package_name`

#### ganglia::gmetad

install and configure the ganglia gmetad daemon.

```puppet
# defaults
class { 'ganglia::gmetad':
  all_trusted                     => false,
  clusters                        => [
    { 'name' => 'my cluster', 'address' => 'localhost' },
  ],
  gridname                        => undef,
  rras                            => $::ganglia::params::rras,
  trusted_hosts                   => [],
  gmetad_package_name             => $::ganglia::params::gmetad_package_name,
  gmetad_service_name             => $::ganglia::params::gmetad_service_name,
  gmetad_service_config           => $::ganglia::params::gmetad_service_config,
  gmetad_user                     => $::ganglia::params::gmetad_user,
  gmetad_case_sensitive_hostnames =>
    $::ganglia::params::gmetad_case_sensitive_hostnames
}
```

##### `all_trusted`

`Boolean` defaults to: false

If set to true, will allow any host to query ganglia data via the XML query
port.  Corresponds to the `all_trusted` field in `gmetad.conf`.

##### `clusters`

`Array of Hash` defaults to:

    [ { 'name' => 'my cluster', 'address' => 'localhost' } ]

Supported hash keys are:

* `name` (required)
* `polling_interval` (optional)
* `address` (may be a `String` or `Array of String`

##### `gridname`

`String` defaults to: `undef`

##### `rras`

`Array of Hash` defaults to:

```puppet
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

Supported hash keys (all keys are required) are:

* `cf`

consolidation function (cf) can be AVERAGE | MIN | MAX | LAST

* `xff`

xfiles factor (xff) defines what part of a consolidation interval may be made
up from *UNKNOWN* data while the consolidated value is still regarded as known.
It is given as the ratio of allowed *UNKNOWN* PDPs to the number of PDPs in the
interval. Thus, it ranges from 0 to 1 (exclusive).

* `steps`

steps defines how many of these primary data points are used to build a
consolidated data point which then goes into the archive.

* `rows`

rows defines how many generations of data values are kept in an RRA.
Obviously, this has to be greater than zero.

##### `trusted_hosts`

`Array of Strings` defaults to: '[]'

Each string matches a hostname that is allowed to query ganglia data via the
XML query port.  Corresponds to the `all_trusted` field in `gmetad.conf`.

##### `gmetad_package_name`

`String` defaults to: `$::ganglia::params::gmetad_package_name`

##### `gmetad_service_name`

`String` defaults to: `$::ganglia::params::gmetad_service_name`

##### `gmetad_service_config`

`String` defaults to: `$::ganglia::params::gmetad_service_config`

##### `gmetad_user`

`String` defaults to: `$::ganglia::params::gmetad_user`

##### `gmetad_case_sensitive_hostnames`

`Integer` defaults to: `$::ganglia::params::gmetad_case_sensitive_hostnames`

Accepted values are `0` or `1`.

#### ganglia::web

Install and configure the ganglia web front end.

```puppet
# defaults
class{ 'ganglia::web':
  ganglia_ip   => '127.0.0.1',
  ganglia_port => 8652,
}
```

##### `ganglia_ip`

`String` defaults to: `127.0.0.1`

##### `ganglia_port`

`String or Integer` defaults to: `Integer: 8652`

Passing a `String` to `$ganglia_port` is deprecated.  Please use an `Integer`
value.


Limitations
-----------

### Tested Platforms

It has been tested on:

* el5.x
* el6.x
* el7.x
* ubuntu 12.04
* ubuntu 13.04
* debian 6.07

### Puppet Version Compatibility

Versions | Puppet 2.7 | Puppet 3.x | Puppet 4.x
:--------|:----------:|:----------:|:----------:
**1.x**  | **yes**    | **yes**    | no
**2.x**  | no         | **yes**    | **yes**

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


Contributing
------------

1. Fork it on github
2. Make a local clone of your fork
3. Create a topic branch.  Eg, `feature/mousetrap`
4. Make/commit changes
    * Commit messages should be in [imperative tense](http://git-scm.com/book/ch5-2.html)
    * Check that linter warnings or errors are not introduced - `bundle exec rake lint`
    * Check that `Rspec-puppet` unit tests are not broken and coverage is added for new
      features - `bundle exec rake spec`
    * Documentation of API/features is updated as appropriate in the README
    * If present, `beaker` acceptance tests should be run and potentially
      updated - `bundle exec rake beaker`
5. When the feature is complete, rebase / squash the branch history as
   necessary to remove "fix typo", "oops", "whitespace" and other trivial commits
6. Push the topic branch to github
7. Open a Pull Request (PR) from the *topic branch* onto parent repo's `master` branch


See Also
--------

 * [Ganglia](http://ganglia.sourceforge.net/)
