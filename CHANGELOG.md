
#### [Current]
 * [7818fc1](../../commit/7818fc1) - __(Joshua Hoblitt)__ Merge pull request [#65](../../issues/65) from jhoblitt/jthiltges-gmond-rpm-array

rebase of [#63](../../issues/63) on current master
 * [0a6cee9](../../commit/0a6cee9) - __(John Thiltges)__ Add rspec tests for gmond_package_name parameter in ganglia::gmond
 * [8ea2139](../../commit/8ea2139) - __(John Thiltges)__ Add gmond_package_name as a parameter, allowing a string or array
 * [285de69](../../commit/285de69) - __(Joshua Hoblitt)__ Merge pull request [#64](../../issues/64) from jthiltges/rspec-versioncmp

Set puppetversion in the facts for rspec tests
 * [fa5bef8](../../commit/fa5bef8) - __(John Thiltges)__ Set puppetversion in the facts for rspec tests
 * [c51c22d](../../commit/c51c22d) - __(Joshua Hoblitt)__ Merge pull request [#62](../../issues/62) from hirocaster/fix-example

Fix puppet syntax in example
 * [75b0b1d](../../commit/75b0b1d) - __(hirocaster)__ Fix puppet syntax
 * [8b37e2f](../../commit/8b37e2f) - __(Joshua Hoblitt)__ Merge pull request [#59](../../issues/59) from hwoodson/master

Fixed a typo in the README.md
 * [94d794c](../../commit/94d794c) - __(Heath Woodson)__ Removed excess space and extra => in the README.md
 * [aae1f69](../../commit/aae1f69) - __(Heath Woodson)__ Fixed added a missing comma in the README.md
 * [c6d20d6](../../commit/c6d20d6) - __(Heath Woodson)__ Fixed one more typo in the README.md
 * [9045b5e](../../commit/9045b5e) - __(Heath Woodson)__ Fixed a typo in the README.md
 * [0ecf032](../../commit/0ecf032) - __(Joshua Hoblitt)__ bump version to v2.1.0
 * [7ad4f41](../../commit/7ad4f41) - __(Joshua Hoblitt)__ Merge pull request [#57](../../issues/57) from NoodlesNZ/master

Fixed conf.php for current ganglia web
 * [5f4a366](../../commit/5f4a366) - __(Nick Le Mouton)__ Fixed conf.php for current ganglia web
 * [c5710ac](../../commit/c5710ac) - __(Joshua Hoblitt)__ Merge pull request [#55](../../issues/55) from jhoblitt/feature/v2.0.0

v2.0.0
 * [12cbbb3](../../commit/12cbbb3) - __(Joshua Hoblitt)__ bump version to v2.0.0
 * [8029f6b](../../commit/8029f6b) - __(Joshua Hoblitt)__ add Puppet Version Compatibility subsection to README
 * [82f0d95](../../commit/82f0d95) - __(Joshua Hoblitt)__ migrate & revise API docs into README

API documentation was duplicated and inconsistent between the README and
individual .pp files.  This change makes the README unambiguously
authoritative.

 * [db84982](../../commit/db84982) - __(Joshua Hoblitt)__ deprecate passing a String the ganglia::web param ganglia_port

    Passing a String to $ganglia_port is deprecated.  Please use an Integer
    value.

 * [aca1b0d](../../commit/aca1b0d) - __(Joshua Hoblitt)__ validate ganglia::gmetad gmetad_case_sensitive_hostnames param
 * [41550fb](../../commit/41550fb) - __(Joshua Hoblitt)__ set stdlib requirement to 4.6.0

Needed for the `validate_integer` function.

 * [03105d3](../../commit/03105d3) - __(Joshua Hoblitt)__ fully qualify all variable lookups in foreign namespaces
 * [1d6aeff](../../commit/1d6aeff) - __(Joshua Hoblitt)__ add Contributing section to README
 * [b7f7ff1](../../commit/b7f7ff1) - __(Joshua Hoblitt)__ update gmond el6 ERB based on 3.7.1-2.el6 packages
 * [c4133db](../../commit/c4133db) - __(Joshua Hoblitt)__ Merge pull request [#54](../../issues/54) from jhoblitt/feature/el-7-support

add preliminary el7.x support
 * [ba8c351](../../commit/ba8c351) - __(Joshua Hoblitt)__ add preliminary el7.x support
 * [3ca8bab](../../commit/3ca8bab) - __(Joshua Hoblitt)__ Merge pull request [#51](../../issues/51) from jhoblitt/feature/puppet-4.0

Feature/puppet 4.0
 * [0e0918f](../../commit/0e0918f) - __(Joshua Hoblitt)__ unwind {install,config,service} pattern

* convert from {install,config,service} pattern to monolithic classes
* replace `scope.lookupvar()` in ERB templates with local variables
* update rspec-puppet puppet function test matchers

Principally motivated by the desire to replace `scope.lookupvar()` calls in ERB
templates with ruby local variables as an attempt to escape from puppet 3.x's
insane :undef handling.

 * [df21f69](../../commit/df21f69) - __(Joshua Hoblitt)__ update rspec-puppet gem version to ~> 2.2

For bugfixes and to allow the 2.x version to float as the API stability has
been better than with the 1.x series.

 * [3cc27ee](../../commit/3cc27ee) - __(Joshua Hoblitt)__ remove default nodset symlink

To resolve this PMT error:
    Puppet::ModuleTool::Errors::ModuleToolError: Found symlinks. Symlinks in modules are not allowed, please remove them.

 * [2464cd6](../../commit/2464cd6) - __(Joshua Hoblitt)__ add centos 5.11 nodeset
 * [6665692](../../commit/6665692) - __(Joshua Hoblitt)__ add puppet-blacksmith gem
 * [82ad603](../../commit/82ad603) - __(Joshua Hoblitt)__ add travis_lint rake target
 * [0497067](../../commit/0497067) - __(Joshua Hoblitt)__ fix whitespace
 * [fca163b](../../commit/fca163b) - __(Joshua Hoblitt)__ add ruby 2.2 to travis matrix
 * [0dc08c5](../../commit/0dc08c5) - __(Joshua Hoblitt)__ add :validate to default rake target list
 * [caf39d4](../../commit/caf39d4) - __(Joshua Hoblitt)__ add metadata-json-lint gem

Needed by rake metadata.json validation target.

 * [1555337](../../commit/1555337) - __(Joshua Hoblitt)__ update travis matrix puppet 3.x minimum version to 3.7
 * [dcf7ec8](../../commit/dcf7ec8) - __(Joshua Hoblitt)__ update rspec-puppet gem version to ~> 2.1.0

For compatibility with puppet 4.0.0

 * [9cb84f9](../../commit/9cb84f9) - __(Joshua Hoblitt)__ add junit/ to .gitiginore

Generated by beaker 5

 * [c3fe46c](../../commit/c3fe46c) - __(Joshua Hoblitt)__ add puppet 4.0 to travis matrix
 * [3c2af63](../../commit/3c2af63) - __(Joshua Hoblitt)__ remove puppet 2.7 from travis matrix

4.0.0 has been released; support major release -1

 * [a030df6](../../commit/a030df6) - __(Joshua Hoblitt)__ update beaker nodesets to use current chef/bento boxes
 * [b8ad5d6](../../commit/b8ad5d6) - __(Joshua Hoblitt)__ Merge pull request [#53](../../issues/53) from mrolli/feature/option_mcastif

Added option mcast_if for multicast configuration
 * [efa3342](../../commit/efa3342) - __(Rolli, Michael (ID))__ Additonal rspec tests for multicast configurations.

The test suite additionally features gmond configuration
tests for multicast channel configuration within its own
context.

 * [dfad23e](../../commit/dfad23e) - __(Rolli, Michael (ID))__ Added option mcast_if for multicast configuration

Often it is desirable to limit multicast traffic to certain interfaces
only. gmond features the configuration option mcast_if for
udp_send_channel and udp_recv_channels, which was added to gmond erb
templates.

 * [d6a089d](../../commit/d6a089d) - __(Joshua Hoblitt)__ Merge pull request [#52](../../issues/52) from mrolli/bugfix/gmetad-template-line-breaks-in-data-sources

Fix line breaks if not using arrays for ds.
 * [bff4bee](../../commit/bff4bee) - __(Rolli, Michael (ID))__ Fix line breaks if not using arrays for ds.

Fix missing line break if one does provide several hosts as string
instead of an array. Previously if using the template without a host
array the data sources got lined up on a single line.

#### v1.5.0
 * [655e4fc](../../commit/655e4fc) - __(Joshua Hoblitt)__ Merge pull request [#49](../../issues/49) from jhoblitt/feature/v1.5.0

Feature/v1.5.0
 * [1d73998](../../commit/1d73998) - __(Joshua Hoblitt)__ bump version to v1.5.0
 * [cd318c9](../../commit/cd318c9) - __(Joshua Hoblitt)__ add log/ to .gitignore

Generated by beaker during acceptance testing.

 * [c87d8eb](../../commit/c87d8eb) - __(Joshua Hoblitt)__ Merge pull request [#48](../../issues/48) from tskirvin/master

gmetad.conf - adding support for managing 'all_trusted' and 'trusted_hos...
 * [8858d19](../../commit/8858d19) - __(Tim Skirvin)__ LICENSE - updating to 2015
 * [9e493d0](../../commit/9e493d0) - __(Tim Skirvin)__ README.md - adding trusted_hosts and all_trusted to gmetad docs
 * [8bc3e43](../../commit/8bc3e43) - __(Tim Skirvin)__ gmetad.conf - adding support for managing 'all_trusted' and 'trusted_hosts'

Adds two optional parameters to gmetad.pp - 'all_trusted' (a boolean,
default false), and 'trusted_hosts' (array of strings, default empty).
These can be used to populate the corresponding fields in gmetad.conf.

Includes a spec file check for these parameters as well.

#### v1.4.1
 * [bc0d39f](../../commit/bc0d39f) - __(Joshua Hoblitt)__ Merge pull request [#47](../../issues/47) from jhoblitt/feature/v1.4.1

Feature/v1.4.1
 * [c0b4f03](../../commit/c0b4f03) - __(Joshua Hoblitt)__ bump version to v1.4.1
 * [7ed2502](../../commit/7ed2502) - __(Joshua Hoblitt)__ allow future parser to fail in travis matrix
 * [79fcdbf](../../commit/79fcdbf) - __(Joshua Hoblitt)__ update rspec tests for puppet 3.7.x future parser compatibility
 * [b50946b](../../commit/b50946b) - __(Joshua Hoblitt)__ pin rspec on Ruby 1.8.7 (rspec/rspec-core[#1864](../../issues/1864))
 * [043ddf5](../../commit/043ddf5) - __(Joshua Hoblitt)__ use rspec-puppet 2.0.0 from gems instead of git
 * [4795cdd](../../commit/4795cdd) - __(Joshua Hoblitt)__ add FACTER_GEM_VERSION to Gemfile
 * [c1b2b4b](../../commit/c1b2b4b) - __(Joshua Hoblitt)__ Merge pull request [#45](../../issues/45) from cmurphy/fix_readme

Fix web example in README
 * [1e2cfaa](../../commit/1e2cfaa) - __(Colleen Murphy)__ Fix web example in README
 * [5d7feb7](../../commit/5d7feb7) - __(Joshua Hoblitt)__ Merge pull request [#43](../../issues/43) from drewr/master

::lsbmajdistrelease is a string now
 * [ee82ae1](../../commit/ee82ae1) - __(Joshua Hoblitt)__ Merge pull request [#42](../../issues/42) from NoodlesNZ/futureparser

Add fix for future parser in puppet 3.7.4
 * [0f52488](../../commit/0f52488) - __(Drew Raines)__ ::lsbmajdistrelease is a string now
 * [b300a84](../../commit/b300a84) - __(Nick Le Mouton)__ Add fix for future parser in puppet 3.7.4 (Future parser seems to treat facts as strings).

#### v1.4.0
 * [a55f203](../../commit/a55f203) - __(Joshua Hoblitt)__ Merge pull request [#40](../../issues/40) from jhoblitt/feature/v1.4.0

Feature/v1.4.0
 * [dc61baf](../../commit/dc61baf) - __(Joshua Hoblitt)__ bump version to v1.4.0
 * [bd8073b](../../commit/bd8073b) - __(Joshua Hoblitt)__ remove Encoding gem kludge from spec_helper.rb
 * [714991e](../../commit/714991e) - __(Joshua Hoblitt)__ replace Modulefile with metadata.json
 * [8c528a4](../../commit/8c528a4) - __(Joshua Hoblitt)__ update spec_helper_acceptance to use #puppet_module_install

Instead of custom scp logic

 * [d87ab84](../../commit/d87ab84) - __(Joshua Hoblitt)__ change nodeset default to centos-65-x64
 * [7b465f8](../../commit/7b465f8) - __(Joshua Hoblitt)__ update beaker nodesets from puppet-module_skel
 * [56b414f](../../commit/56b414f) - __(Joshua Hoblitt)__ fix Gemfile w/s
 * [58dba7b](../../commit/58dba7b) - __(Joshua Hoblitt)__ update fixtures stdlib to 4.2.0
 * [668a7d4](../../commit/668a7d4) - __(Joshua Hoblitt)__ Merge pull request [#34](../../issues/34) from NoodlesNZ/overridehostname

Fix problem with undef override_hostname
 * [b38c558](../../commit/b38c558) - __(Nick Le Mouton)__ Fix problem with undef override_hostname
 * [d8d443a](../../commit/d8d443a) - __(Joshua Hoblitt)__ Merge pull request [#32](../../issues/32) from NoodlesNZ/master

Change ganglia_port default to string
 * [92452ef](../../commit/92452ef) - __(Joshua Hoblitt)__ Merge pull request [#37](../../issues/37) from jhoblitt/feature/future_parser

Feature/future parser
 * [1978bdb](../../commit/1978bdb) - __(Joshua Hoblitt)__ enable travis container based builds
 * [eda60cb](../../commit/eda60cb) - __(Joshua Hoblitt)__ update rspec-puppet to v2.0.0 git tag
 * [4549e6c](../../commit/4549e6c) - __(Joshua Hoblitt)__ Merge pull request [#36](../../issues/36) from jhoblitt/feature/10_000-cuts-of-ruby-1.8.7

exclude beaker gems from travis
 * [098eb2c](../../commit/098eb2c) - __(Joshua Hoblitt)__ exclude beaker gems from travis
 * [3ddba81](../../commit/3ddba81) - __(Nick Le Mouton)__ Fix port validation
 * [9f896cc](../../commit/9f896cc) - __(Joshua Hoblitt)__ Merge pull request [#33](../../issues/33) from NoodlesNZ/overridehostname

Added global_override_hostname
 * [c5b21f5](../../commit/c5b21f5) - __(Nick Le Mouton)__ Add global_override_hostname Add gmond template interpolation
 * [2aac7da](../../commit/2aac7da) - __(Joshua Hoblitt)__ Merge pull request [#30](../../issues/30) from NoodlesNZ/globals

Additional work for PR [#18](../../issues/18)
 * [cf9f899](../../commit/cf9f899) - __(Nick Le Mouton)__ Formatting etc
 * [ced568a](../../commit/ced568a) - __(Joshua Hoblitt)__ Merge pull request [#31](../../issues/31) from jhoblitt/feature/test_template_content

Add simple test coverage of gmetad.conf template
 * [948b311](../../commit/948b311) - __(Joshua Hoblitt)__ fix linter 80char line warnings
 * [a31d4ed](../../commit/a31d4ed) - __(Joshua Hoblitt)__ fail on linter warnings
 * [8f2196d](../../commit/8f2196d) - __(Joshua Hoblitt)__ Add simple test coverage of gmetad.conf template

Per issue [#2](../../issues/2)

 * [3341c45](../../commit/3341c45) - __(Nick Le Mouton)__ Removed note about specific changes to RHEL6/CentOS6
 * [90fd18f](../../commit/90fd18f) - __(Nick Le Mouton)__ Fixed scope
 * [64bcedb](../../commit/64bcedb) - __(Nick Le Mouton)__ Merge remote-tracking branch 'upstream/master' into globals
 * [63cad00](../../commit/63cad00) - __(Joshua Hoblitt)__ Merge pull request [#27](../../issues/27) from NoodlesNZ/master

Fix scope problem for gmetad config
 * [824cc2b](../../commit/824cc2b) - __(Nick Le Mouton)__ Fixing scope problems
 * [1e1f655](../../commit/1e1f655) - __(Nick Le Mouton)__ Added additional params
 * [d25a2c4](../../commit/d25a2c4) - __(Nick Le Mouton)__ Merge remote-tracking branch 'upstream/master' into globals
 * [0203edb](../../commit/0203edb) - __(Joshua Hoblitt)__ Merge pull request [#29](../../issues/29) from NoodlesNZ/params

Added additional parameters to gmetad
 * [ef70409](../../commit/ef70409) - __(Nick Le Mouton)__ Added additional parameters to gmetad
 * [9d9face](../../commit/9d9face) - __(Joshua Hoblitt)__ Merge pull request [#26](../../issues/26) from jhoblitt/feature/future_parser

Feature/future parser
 * [6f57915](../../commit/6f57915) - __(Joshua Hoblitt)__ add compatibility with rspec 1.0.1+ exception handling
 * [a2a471f](../../commit/a2a471f) - __(Joshua Hoblitt)__ add future parser to travis matrix
 * [a2e6d96](../../commit/a2e6d96) - __(Joshua Hoblitt)__ Merge pull request [#24](../../issues/24) from NoodlesNZ/master

Added rspec test for ganglia_validate_rras()

Closes [#24](../../issues/24)

 * [1a0ef39](../../commit/1a0ef39) - __(Nick Le Mouton)__ Added rspec test for ganglia_validate_rras()
 * [67db493](../../commit/67db493) - __(Joshua Hoblitt)__ Merge pull request [#22](../../issues/22) from NoodlesNZ/master

Update gmetad.conf and add custom RRAs
 * [4cf6433](../../commit/4cf6433) - __(Nick Le Mouton)__ Fixed gmetad_service_erb variable problem
 * [23ca842](../../commit/23ca842) - __(Nick Le Mouton)__ Fixed el6 case_sensitive_hostnames
 * [21ef612](../../commit/21ef612) - __(Joshua Hoblitt)__ Merge pull request [#23](../../issues/23) from jhoblitt/feature/beaker

Feature/beaker
 * [b2989ef](../../commit/b2989ef) - __(Joshua Hoblitt)__ restrict the allow_virtual param to puppet 3.6.1+

The package type's allow_virtual param was added in puppet 3.6.1

 * [3d5b5ec](../../commit/3d5b5ec) - __(Joshua Hoblitt)__ add ruby 2.1.4 to travis matrix
 * [3d5faeb](../../commit/3d5faeb) - __(Joshua Hoblitt)__ update .gitignore
 * [1a8ae2c](../../commit/1a8ae2c) - __(Joshua Hoblitt)__ remove stale ./tests dir
 * [1e8d589](../../commit/1e8d589) - __(Joshua Hoblitt)__ remove puppet 2.7.14 from travis matrix
 * [fcc8a60](../../commit/fcc8a60) - __(Joshua Hoblitt)__ fix gemetad.conf template on debian
 * [4549c03](../../commit/4549c03) - __(Joshua Hoblitt)__ fix ganglia user name on el6.x
 * [19f6e90](../../commit/19f6e90) - __(Joshua Hoblitt)__ pin puppet-lint version < 1.1.0

To work around https://github.com/rodjek/puppet-lint/issues/331

 * [bad9d02](../../commit/bad9d02) - __(Joshua Hoblitt)__ suppress the package types allow_virtual warning

    Warning: The package type's allow_virtual parameter will be changing its default value from false to true in a future release. If you do not want to allow virtual packages, please explicitly set allow_virtual to false.

 * [3cbefc9](../../commit/3cbefc9) - __(Joshua Hoblitt)__ add beaker support

Largely cut'n'pasted from puppetlabs-concat

 * [912be75](../../commit/912be75) - __(Joshua Hoblitt)__ remove rspec-system support
 * [3c1997e](../../commit/3c1997e) - __(Nick Le Mouton)__ Fixed validation issues
 * [aee3385](../../commit/aee3385) - __(Nick Le Mouton)__ Fixed validation for xff
 * [1c241e2](../../commit/1c241e2) - __(Nick Le Mouton)__ Added validation function into class
 * [0066ecf](../../commit/0066ecf) - __(Nick Le Mouton)__ Added validation for cf
 * [8622e51](../../commit/8622e51) - __(Nick Le Mouton)__ Changed xff, steps and rows params in gmetad to float/integer, integer and integer respectively. This makes it easier to validate
 * [48f9c24](../../commit/48f9c24) - __(Nick Le Mouton)__ Initial work for ganglia_validate_rras()
 * [b23f94f](../../commit/b23f94f) - __(Nick Le Mouton)__ Fixed grammar
 * [e935413](../../commit/e935413) - __(Nick Le Mouton)__ Fixed markdown
 * [c892fd0](../../commit/c892fd0) - __(Nick Le Mouton)__ Added documentation on RRAs
 * [d82d139](../../commit/d82d139) - __(Nick Le Mouton)__ Added gmeta_case_sensitive_hostnames
 * [af4338d](../../commit/af4338d) - __(Nick Le Mouton)__ Re-added setuid_username
 * [9a10187](../../commit/9a10187) - __(Nick Le Mouton)__ Fixed whitespace issue on params.pp
 * [32b2c66](../../commit/32b2c66) - __(Nick Le Mouton)__ Fixed RRAs format
 * [07e8425](../../commit/07e8425) - __(Nick Le Mouton)__ Use default rras for gmetad
 * [4bcbfdd](../../commit/4bcbfdd) - __(Nick Le Mouton)__ Changed gmetad template to gmetad.conf.erb
 * [61cdc03](../../commit/61cdc03) - __(Nick Le Mouton)__ Trying to use params defaults for rras
 * [ef80fb6](../../commit/ef80fb6) - __(Nick Le Mouton)__ Changed name of gmetad template
 * [e5cebcf](../../commit/e5cebcf) - __(Nick Le Mouton)__ Added custom RRAs to gmetad and updated gmetad.conf from ganglia repo
 * [1095fc9](../../commit/1095fc9) - __(goungy)__ Renaming ganglia_globals_* variables to globals_* and adding description in the README

Renaming ganglia_globals_* variables to globals_* and adding description
in the README

 * [e56d0e2](../../commit/e56d0e2) - __(Joshua Hoblitt)__ Merge pull request [#20](../../issues/20) from george-b/whitespace_removal

Removes trailing whitespace
 * [4b1bc5f](../../commit/4b1bc5f) - __(George Brown)__ Removes trailing whitespace

A number of files contained trailing whitespace, this has been removed
with the following perl one-liner.

perl -pi -e 's/ +$//' *

Not having whitespace prevents confusing diff outputs such as the
following.

https://github.com/jhoblitt/puppet-ganglia/pull/3#discussion-diff-7579522

 * [04a083e](../../commit/04a083e) - __(Joshua Hoblitt)__ Merge pull request [#19](../../issues/19) from george-b/el6_fixes

Sets user to nobody on EL6
 * [2c701a4](../../commit/2c701a4) - __(Joshua Hoblitt)__ Merge pull request [#17](../../issues/17) from krunaldo/patch-1

Removed lies from gmetad config for el6
 * [a594b40](../../commit/a594b40) - __(George Brown)__ Sets user to nobody on EL6

As raised in the following PR the user nobody is used rather than
ganglia on EL6.

https://github.com/jhoblitt/puppet-ganglia/pull/17

This change updates the default parameter value for the gmetad user and
alters the gmond template to reflect this.

 * [925f5f3](../../commit/925f5f3) - __(goungy)__ [EL6] Adding possibility to set udp_send_channel >bind_hostname in gmond.conf

[EL6] Adding possibility to set udp_send_channel >bind_hostname in
gmond.conf

 * [74c7db7](../../commit/74c7db7) - __(goungy)__ [EL6] Adding possibility to set ganglia->globals->send_metadata_interval for gmond.conf

[EL6] Adding possibility to set ganglia->globals->send_metadata_interval
for gmond.conf

 * [097cff6](../../commit/097cff6) - __(goungy)__ [EL6] Adding possibility to set ganglia->globals->host_dmax parameter for gmond.conf

[EL6] Adding possibility to set ganglia->globals->host_dmax parameter
for gmond.conf

 * [b6b5ab8](../../commit/b6b5ab8) - __(goungy)__ [EL6] Adding possibility to set ganglia->globals->deaf parameter for gmond.conf

[EL6] Adding possibility to set ganglia->globals->deaf parameter for
gmond.conf

 * [972e5ad](../../commit/972e5ad) - __(Jonathan Beckman)__ Removed lies from gmetad config for el6

By default EL6 ganglia runs as nobody and not ganglia.
This fixes the issue by changing the user that ganglia is
run as to correct one according to the rest of the manifest.

#### v1.3.0
 * [657828f](../../commit/657828f) - __(Joshua Hoblitt)__ Merge pull request [#15](../../issues/15) from jhoblitt/feature/v1.3.0

bump version to v1.3.0
 * [ef745e9](../../commit/ef745e9) - __(Joshua Hoblitt)__ bump version to v1.3.0
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
