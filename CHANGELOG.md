
#### [Current]
 * [221b474](../../commit/221b474) - __(Joshua Hoblitt)__ Merge pull request [#14](../../issues/14) from jhoblitt/feature/validate_gmetad_clusters

Feature/validate gmetad clusters
 * [fbbeb0e](../../commit/fbbeb0e) - __(Joshua Hoblitt)__ make ganglia_validate_clusters output consistently testable

Between Ruby 1.8.7 and 1.9.3+

 * [59d378d](../../commit/59d378d) - __(Joshua Hoblitt)__ add docstring to ganglia_validate_clusters() function
 * [53988e9](../../commit/53988e9) - __(Joshua Hoblitt)__ deeply validate ganglia::gmetad's clusters parameter

This should address the confusing template error reported in [#12](../../issues/12) when
incorrect data is passed to this parameter.

 * [aa98bee](../../commit/aa98bee) - __(Joshua Hoblitt)__ update copyright notice year (-2014)
 * [375dad9](../../commit/375dad9) - __(Joshua Hoblitt)__ update .gitignore
 * [57fde5b](../../commit/57fde5b) - __(Joshua Hoblitt)__ Merge pull request [#13](../../issues/13) from xavpaice/master

Add IPv6 support for Debian based gmond
 * [bd53972](../../commit/bd53972) - __(Xav Paice)__ Add send_metadata_interval at 300s to debian

Previously, the send_metadata_interval for gmond was set at 0 for
Debian based systems, and 300 for Red Hat based systems.  This change
synchronizes the setting such that Debian is now 300s as well.

 * [d88c383](../../commit/d88c383) - __(Xav Paice)__ Add IPv6 capability for RHEL/CentOS

For gmond.conf, add same capability as for Debian systems.

 * [d21f12e](../../commit/d21f12e) - __(Xav Paice)__ Add IPv6 support for gmond listener

This commit adds the 'family' parameter for udp and tcp listeners
for the gmond config, for Debian based systems.

 * [9b84864](../../commit/9b84864) - __(Xav Paice)__ Add IPv6 support for gmond listener

This commit adds the 'family' parameter for udp and tcp listeners
for the gmond config, for Debian based systems.

 * [37252ad](../../commit/37252ad) - __(Joshua Hoblitt)__ trim travis test matrix

#### v1.2.2
 * [5f22d49](../../commit/5f22d49) - __(Joshua Hoblitt)__ bump version to v1.2.2
 * [b361ec4](../../commit/b361ec4) - __(Joshua Hoblitt)__ rm old Changelog (replaced by CHANGELOG.md)

#### v1.2.1
 * [2f3a5c7](../../commit/2f3a5c7) - __(Joshua Hoblitt)__ bump version to v1.2.1
 * [73457c5](../../commit/73457c5) - __(Joshua Hoblitt)__ Merge pull request [#11](../../issues/11) from jhoblitt/gmond_template_array_checking

change gmond erb templates to gracefully handle nil variables
 * [0c0d598](../../commit/0c0d598) - __(Joshua Hoblitt)__ change gmond erb templates to gracefully handle nil variables

These variables to ganglia::gmond may now safely be undef/nil:

* udp_send_channel
* udp_recv_channel
* tcp_accept_channel

#### v1.2.0
 * [2555891](../../commit/2555891) - __(Joshua Hoblitt)__ bump version to v1.2.0
 * [ad95594](../../commit/ad95594) - __(Joshua Hoblitt)__ update README param docs + boilerplate sections
 * [fe92cb2](../../commit/fe92cb2) - __(Joshua Hoblitt)__ add param validation to ganglia::web class
 * [e4ed800](../../commit/e4ed800) - __(Joshua Hoblitt)__ Merge pull request [#10](../../issues/10) from jhoblitt/debian_support

add debian support
 * [33aec0b](../../commit/33aec0b) - __(Joshua Hoblitt)__ add debian support

#### v1.1.0
 * [724099c](../../commit/724099c) - __(Joshua Hoblitt)__ bump version to v1.1.0
 * [25f68d1](../../commit/25f68d1) - __(Joshua Hoblitt)__ remove outdated 'all inherent from base' inheritance pattern
 * [a81c8a4](../../commit/a81c8a4) - __(Joshua Hoblitt)__ add ubuntu compatibility to rspec-system tests

Conflicts:
	spec/classes/params_spec.rb

 * [d11f7f4](../../commit/d11f7f4) - __(Joshua Hoblitt)__ Merge pull request [#9](../../issues/9) from jhoblitt/system_tests

add extremely basic rspec-system tests
 * [ebccc4b](../../commit/ebccc4b) - __(Joshua Hoblitt)__ fix gmetad.conf handling of an undefined gridname param
 * [be89a48](../../commit/be89a48) - __(Joshua Hoblitt)__ fix ganglia::gmetad::{install,config} ordering issue

`ganglia::gmetad` would fail on el6.x when the /etc/ganglia dir wasn't present
as it was trying to create the configuration file before the RPM was installed
(which may create that dir).  This wasn't seen in my test env as ganglia::gmond
/ the gmond RPM were always creating that dir.  Turned up by the rspec-system
tests.

 * [4380df1](../../commit/4380df1) - __(Joshua Hoblitt)__ add extremely basic rspec-system tests
 * [6c8d64f](../../commit/6c8d64f) - __(Joshua Hoblitt)__ resolve rspec-puppet > 1 deprecation warnings

    DEPRECATION: include_class is deprecated. Use contain_class instead.

 * [aed3ee5](../../commit/aed3ee5) - __(Jeremy Kitchen)__ ubuntu has this fact set, so should the test
 * [eb26bf1](../../commit/eb26bf1) - __(Jeremy Kitchen)__ custom status command only applies to <= 12.10
 * [106167c](../../commit/106167c) - __(Jeremy Kitchen)__ fixed broken test for debian, added ubuntu/solaris
 * [b70a999](../../commit/b70a999) - __(Jeremy Kitchen)__ gmetad doesn't have a good status command on ubuntu
 * [a9c4271](../../commit/a9c4271) - __(Jeremy Kitchen)__ ganglia-monitor service on ubuntu doesn't have a status command
 * [91103d2](../../commit/91103d2) - __(Jeremy Kitchen)__ I cant' tyep
 * [a64c126](../../commit/a64c126) - __(Jeremy Kitchen)__ port to ubuntu

#### v1.0.2
 * [e878d16](../../commit/e878d16) - __(Joshua Hoblitt)__ bump version to v1.0.2
 * [fc74fe2](../../commit/fc74fe2) - __(Joshua Hoblitt)__ implement anchor pattern
 * [94b920c](../../commit/94b920c) - __(Joshua Hoblitt)__ update travis matrix

#### v1.0.1
 * [ed4fe88](../../commit/ed4fe88) - __(Joshua Hoblitt)__ bump version to v1.0.1
 * [d327d2b](../../commit/d327d2b) - __(Joshua Hoblitt)__ update erb templates to use instance variables

#### v1.0.0
 * [0b6c068](../../commit/0b6c068) - __(Joshua Hoblitt)__ bump version to v1.0.0
 * [2e4a9d4](../../commit/2e4a9d4) - __(Joshua Hoblitt)__ remove usage of $::lsbmajdistrelease fact

Instead use $::operatingsystemmajrelease as this fact is not dependant on
redhat-lsb being present on the system.

 * [cd410c3](../../commit/cd410c3) - __(Joshua Hoblitt)__ tidy Rakefile quotes
 * [3e285c8](../../commit/3e285c8) - __(Joshua Hoblitt)__ add GFMD highlighting to README
 * [e073c40](../../commit/e073c40) - __(Joshua Hoblitt)__ set stdlib requirement to 3.0.0
 * [0e49b51](../../commit/0e49b51) - __(Joshua Hoblitt)__ add puppet 3.3.0 to travis test matrix
 * [49bb2c3](../../commit/49bb2c3) - __(Joshua Hoblitt)__ puppet-lint should ignore pkg/**
 * [bad4cbb](../../commit/bad4cbb) - __(Joshua Hoblitt)__ exclude spec/fixtures/** from puppet-syntax checking
 * [dfa9fb2](../../commit/dfa9fb2) - __(Joshua Hoblitt)__ rm default init.pp from skel
 * [e36c256](../../commit/e36c256) - __(Joshua Hoblitt)__ Merge remote-tracking branch 'skel/master'
 * [ed6a68b](../../commit/ed6a68b) - __(Joshua Hoblitt)__ ignore patch related files *{.orig,.rej,.patch}
 * [6a67990](../../commit/6a67990) - __(Joshua Hoblitt)__ add puppet-syntax support
 * [bdec024](../../commit/bdec024) - __(Joshua Hoblitt)__ add travis-ci build placard
 * [435661d](../../commit/435661d) - __(Joshua Hoblitt)__ add travis-ci build placard
 * [fb932f9](../../commit/fb932f9) - __(Joshua Hoblitt)__ add example spec test
 * [d230e48](../../commit/d230e48) - __(Joshua Hoblitt)__ exclude travis-ci testing of puppet < 3.2 with ruby >= 2.0
 * [4050f0d](../../commit/4050f0d) - __(Joshua Hoblitt)__ add a default .travis.yml
 * [ceb0ed4](../../commit/ceb0ed4) - __(Joshua Hoblitt)__ add puppet 3.2.0 to travis test set
 * [fae0e4a](../../commit/fae0e4a) - __(Joshua Hoblitt)__ git ignore Gemfile.lock
 * [0005289](../../commit/0005289) - __(Joshua Hoblitt)__ install ruby gems from https://rubygems.org instead of :rubygems

To resolve this warning:

    The source :rubygems is deprecated because HTTP requests are insecure.
    Please change your source to 'https://rubygems.org' if possible, or
    'http://rubygems.org' if not.

 * [c46ff1e](../../commit/c46ff1e) - __(Joshua Hoblitt)__ git ignore Gemfile.lock
 * [e86f789](../../commit/e86f789) - __(Joshua Hoblitt)__ install ruby gems from https://rubygems.org instead of :rubygems

To resolve this warning:

    The source :rubygems is deprecated because HTTP requests are insecure.
    Please change your source to 'https://rubygems.org' if possible, or
    'http://rubygems.org' if not.

 * [95df6b6](../../commit/95df6b6) - __(Joshua Hoblitt)__ first commit

#### v0.0.2
 * [ebacad8](../../commit/ebacad8) - __(Joshua Hoblitt)__ change module version to v0.0.2
 * [1f9ae00](../../commit/1f9ae00) - __(Joshua Hoblitt)__ add a simple Changelog for the forge
 * [6e4b622](../../commit/6e4b622) - __(Joshua Hoblitt)__ change license from GPLv2 or later to Apache 2.0
 * [5c30593](../../commit/5c30593) - __(Joshua Hoblitt)__ enable travis-ci support
 * [dc5469d](../../commit/dc5469d) - __(Joshua Hoblitt)__ fix gmond template namespace issues with puppet >= 3
 * [a56b641](../../commit/a56b641) - __(Joshua Hoblitt)__ cleanup code to pass puppet-lint and add the 'lint' rake target
 * [19c28c4](../../commit/19c28c4) - __(Joshua Hoblitt)__ fill in Modulefile
 * [1ed3432](../../commit/1ed3432) - __(Joshua Hoblitt)__ s/Redhat/RedHat/
 * [a3ef635](../../commit/a3ef635) - __(Joshua Hoblitt)__ add basic README.md
 * [179bccb](../../commit/179bccb) - __(Joshua Hoblitt)__ change gmetad/gmond/web package installation to ensure => present instead of latest
 * [69cd720](../../commit/69cd720) - __(Joshua Hoblitt)__ add rdoc for ganglia::web
 * [497ab53](../../commit/497ab53) - __(Joshua Hoblitt)__ minor ganglia::gmetad example cleanups
 * [e7ee0d2](../../commit/e7ee0d2) - __(Joshua Hoblitt)__ fix ganglia::gmond example to be in valid puppet code instead of bastardized ruby
 * [ae66b95](../../commit/ae66b95) - __(Joshua Hoblitt)__ add rdoc for ganglia::gmetad
 * [a804415](../../commit/a804415) - __(Joshua Hoblitt)__ add default params for all ganglia::gmetad values

Defaults are set per the stock values in gmetad.conf from ganglia-gmetad-3.1.7-6.el6.x86_64

 * [073c3d1](../../commit/073c3d1) - __(Joshua Hoblitt)__ stop trying to enforce a ganglia user uid/gid and remove ganglia::config
 * [8df46ea](../../commit/8df46ea) - __(Joshua Hoblitt)__ fix uid/gid for el5.x
 * [05066dc](../../commit/05066dc) - __(Joshua Hoblitt)__ trivial grammar/caps
 * [a6be1fb](../../commit/a6be1fb) - __(Joshua Hoblitt)__ add rdoc for ganglia::gmond
 * [a762490](../../commit/a762490) - __(Joshua Hoblitt)__ add default params for all ganglia::gmond values

Defaults are set per the stock values in gmond.conf from ganglia-gmond-3.1.7-6.el6.x86_64

 * [c49a049](../../commit/c49a049) - __(Joshua Hoblitt)__ add ganglia::web classes + simple test
 * [3dfb047](../../commit/3dfb047) - __(Joshua Hoblitt)__ remove explicit reference to $ganglia::params namespace
 * [e34b894](../../commit/e34b894) - __(Joshua Hoblitt)__ add trivial tests for ganglia::gmond & ganglia::gmetad
 * [21884ff](../../commit/21884ff) - __(Joshua Hoblitt)__ use the same gmetad erb template for el5.x & el6.x
 * [ab1e680](../../commit/ab1e680) - __(Joshua Hoblitt)__ refactor gmetad to inherit gmetad::params and all other subclasses inherit it
 * [f2821e5](../../commit/f2821e5) - __(Joshua Hoblitt)__ refactor gmond to inherit gmond::params and all other subclasses inherit it
 * [975840e](../../commit/975840e) - __(Joshua Hoblitt)__ check for $::osfamily and fail() on unsupported platforms
 * [da86c3c](../../commit/da86c3c) - __(Joshua Hoblitt)__ add forge and test template files
 * [dda8a6b](../../commit/dda8a6b) - __(Joshua Hoblitt)__ add support for setting the "gridname" in gmetad.conf
 * [0009771](../../commit/0009771) - __(Joshua Hoblitt)__ add a newline to end of each data_source statement so that multiple statements don't end up on the same line
 * [760cf71](../../commit/760cf71) - __(Joshua Hoblitt)__ ii
