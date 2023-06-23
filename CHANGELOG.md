# Changelog

All notable changes to this project will be documented in this file.
Each new release typically also includes the latest modulesync defaults.
These should not affect the functionality of the module.

## [v5.0.0](https://github.com/jhoblitt/puppet-ganglia/tree/v5.0.0) (2023-06-23)

[Full Changelog](https://github.com/jhoblitt/puppet-ganglia/compare/v4.0.0...v5.0.0)

**Breaking changes:**

- drop support for ubuntu 18.04 [\#120](https://github.com/jhoblitt/puppet-ganglia/pull/120) ([jhoblitt](https://github.com/jhoblitt))
- drop support for debian 8 & 9 [\#119](https://github.com/jhoblitt/puppet-ganglia/pull/119) ([jhoblitt](https://github.com/jhoblitt))
- drop support for puppet6 [\#118](https://github.com/jhoblitt/puppet-ganglia/pull/118) ([jhoblitt](https://github.com/jhoblitt))

**Implemented enhancements:**

- add puppet8 support [\#121](https://github.com/jhoblitt/puppet-ganglia/pull/121) ([jhoblitt](https://github.com/jhoblitt))

## [v4.0.0](https://github.com/jhoblitt/puppet-ganglia/tree/v4.0.0) (2022-09-15)

[Full Changelog](https://github.com/jhoblitt/puppet-ganglia/compare/v3.0.4...v4.0.0)

**Breaking changes:**

- disallow empty string values [\#114](https://github.com/jhoblitt/puppet-ganglia/pull/114) ([jhoblitt](https://github.com/jhoblitt))
- Fix type annotations from Tuple to Array [\#113](https://github.com/jhoblitt/puppet-ganglia/pull/113) ([jhoblitt](https://github.com/jhoblitt))
- drop support for SL8 \(doesn't exist\) [\#111](https://github.com/jhoblitt/puppet-ganglia/pull/111) ([jhoblitt](https://github.com/jhoblitt))
- drop support for ubuntu 14.04 [\#109](https://github.com/jhoblitt/puppet-ganglia/pull/109) ([jhoblitt](https://github.com/jhoblitt))
- drop support for debian 7 [\#106](https://github.com/jhoblitt/puppet-ganglia/pull/106) ([jhoblitt](https://github.com/jhoblitt))
- drop support for debian 6 [\#105](https://github.com/jhoblitt/puppet-ganglia/pull/105) ([jhoblitt](https://github.com/jhoblitt))
- drop support for EL6 [\#103](https://github.com/jhoblitt/puppet-ganglia/pull/103) ([jhoblitt](https://github.com/jhoblitt))
- drop support for puppet 5 [\#101](https://github.com/jhoblitt/puppet-ganglia/pull/101) ([jhoblitt](https://github.com/jhoblitt))

**Implemented enhancements:**

- Possible wrong Stdlib type in gmond.pp [\#95](https://github.com/jhoblitt/puppet-ganglia/issues/95)
- allow ganglia::gmond::cluster\_url to be an actual URL [\#112](https://github.com/jhoblitt/puppet-ganglia/pull/112) ([jhoblitt](https://github.com/jhoblitt))
- add support for ubuntu 20.04 [\#110](https://github.com/jhoblitt/puppet-ganglia/pull/110) ([jhoblitt](https://github.com/jhoblitt))
- add support for debian 10 [\#108](https://github.com/jhoblitt/puppet-ganglia/pull/108) ([jhoblitt](https://github.com/jhoblitt))
- add support for debian 9 [\#107](https://github.com/jhoblitt/puppet-ganglia/pull/107) ([jhoblitt](https://github.com/jhoblitt))
- add support for debian 8 [\#104](https://github.com/jhoblitt/puppet-ganglia/pull/104) ([jhoblitt](https://github.com/jhoblitt))
- add support for puppet 7 [\#102](https://github.com/jhoblitt/puppet-ganglia/pull/102) ([jhoblitt](https://github.com/jhoblitt))

**Fixed bugs:**

- restriction of maximum clusters is only 1 ? [\#97](https://github.com/jhoblitt/puppet-ganglia/issues/97)
- Wrong package name for debian [\#96](https://github.com/jhoblitt/puppet-ganglia/issues/96)
- a typo in ganglia/templates/gmond.conf.el6.erb [\#69](https://github.com/jhoblitt/puppet-ganglia/issues/69)

## [v3.0.4](https://github.com/jhoblitt/puppet-ganglia/tree/v3.0.4) (2021-02-22)

[Full Changelog](https://github.com/jhoblitt/puppet-ganglia/compare/v3.0.3...v3.0.4)

**Closed issues:**

- Renewing Puppet Forge Approved Status [\#80](https://github.com/jhoblitt/puppet-ganglia/issues/80)

**Merged pull requests:**

- Updates to EL8 defaults [\#94](https://github.com/jhoblitt/puppet-ganglia/pull/94) ([frizop](https://github.com/frizop))

## [v3.0.3](https://github.com/jhoblitt/puppet-ganglia/tree/v3.0.3) (2020-09-10)

[Full Changelog](https://github.com/jhoblitt/puppet-ganglia/compare/v3.0.2...v3.0.3)

**Merged pull requests:**

- pdk is a dumpster fire [\#93](https://github.com/jhoblitt/puppet-ganglia/pull/93) ([jhoblitt](https://github.com/jhoblitt))

## [v3.0.2](https://github.com/jhoblitt/puppet-ganglia/tree/v3.0.2) (2020-09-10)

[Full Changelog](https://github.com/jhoblitt/puppet-ganglia/compare/v3.0.1...v3.0.2)

## [v3.0.1](https://github.com/jhoblitt/puppet-ganglia/tree/v3.0.1) (2020-09-10)

[Full Changelog](https://github.com/jhoblitt/puppet-ganglia/compare/v3.0.0...v3.0.1)

**Implemented enhancements:**

- Implemenation of gmond\_python\_modules [\#79](https://github.com/jhoblitt/puppet-ganglia/issues/79)

**Merged pull requests:**

- enable forge deployment [\#92](https://github.com/jhoblitt/puppet-ganglia/pull/92) ([jhoblitt](https://github.com/jhoblitt))

## [v3.0.0](https://github.com/jhoblitt/puppet-ganglia/tree/v3.0.0) (2020-09-10)

[Full Changelog](https://github.com/jhoblitt/puppet-ganglia/compare/v2.2.1...v3.0.0)

**Breaking changes:**

- drop support for: puppet \< 5 & el5 [\#89](https://github.com/jhoblitt/puppet-ganglia/pull/89) ([jhoblitt](https://github.com/jhoblitt))

**Implemented enhancements:**

- PDK Convert & Some tests passing on Puppet 6 [\#84](https://github.com/jhoblitt/puppet-ganglia/pull/84) ([frizop](https://github.com/frizop))

**Closed issues:**

- typo in templates/gmond.conf.el5.erb [\#68](https://github.com/jhoblitt/puppet-ganglia/issues/68)
- ganglia::udp\_send\_channel, etc as resources? [\#5](https://github.com/jhoblitt/puppet-ganglia/issues/5)

**Merged pull requests:**

- bump version to v3.0.0 [\#91](https://github.com/jhoblitt/puppet-ganglia/pull/91) ([jhoblitt](https://github.com/jhoblitt))
- add misc puppet-lint plugins [\#90](https://github.com/jhoblitt/puppet-ganglia/pull/90) ([jhoblitt](https://github.com/jhoblitt))
- Small fixes [\#88](https://github.com/jhoblitt/puppet-ganglia/pull/88) ([frizop](https://github.com/frizop))
- Allow package ensure to be overridden [\#87](https://github.com/jhoblitt/puppet-ganglia/pull/87) ([jhoblitt](https://github.com/jhoblitt))
- Allow for RHEL8 [\#83](https://github.com/jhoblitt/puppet-ganglia/pull/83) ([Debilski](https://github.com/Debilski))
- Bump stdlib max version [\#82](https://github.com/jhoblitt/puppet-ganglia/pull/82) ([kobybr](https://github.com/kobybr))
- Add support for gmetad/gmond params [\#67](https://github.com/jhoblitt/puppet-ganglia/pull/67) ([eabecho](https://github.com/eabecho))

## [v2.2.1](https://github.com/jhoblitt/puppet-ganglia/tree/v2.2.1) (2020-09-10)

[Full Changelog](https://github.com/jhoblitt/puppet-ganglia/compare/v2.2.0...v2.2.1)

**Closed issues:**

- stdlib requirement [\#81](https://github.com/jhoblitt/puppet-ganglia/issues/81)
- Make gmond\_service\_config a class parameter [\#61](https://github.com/jhoblitt/puppet-ganglia/issues/61)

## [v2.2.0](https://github.com/jhoblitt/puppet-ganglia/tree/v2.2.0) (2016-02-24)

[Full Changelog](https://github.com/jhoblitt/puppet-ganglia/compare/v2.1.0...v2.2.0)

**Merged pull requests:**

- rebase of \#63 on current master [\#65](https://github.com/jhoblitt/puppet-ganglia/pull/65) ([jhoblitt](https://github.com/jhoblitt))
- Set puppetversion in the facts for rspec tests [\#64](https://github.com/jhoblitt/puppet-ganglia/pull/64) ([jthiltges](https://github.com/jthiltges))
- Fix puppet syntax in example [\#62](https://github.com/jhoblitt/puppet-ganglia/pull/62) ([hirocaster](https://github.com/hirocaster))
- Fixed a typo in the README.md [\#59](https://github.com/jhoblitt/puppet-ganglia/pull/59) ([hwoodson](https://github.com/hwoodson))

## [v2.1.0](https://github.com/jhoblitt/puppet-ganglia/tree/v2.1.0) (2015-10-14)

[Full Changelog](https://github.com/jhoblitt/puppet-ganglia/compare/v2.0.0...v2.1.0)

**Closed issues:**

- Ganglia web conf.php template outdated [\#56](https://github.com/jhoblitt/puppet-ganglia/issues/56)

**Merged pull requests:**

- Fixed conf.php for current ganglia web [\#57](https://github.com/jhoblitt/puppet-ganglia/pull/57) ([NoodlesNZ](https://github.com/NoodlesNZ))

## [v2.0.0](https://github.com/jhoblitt/puppet-ganglia/tree/v2.0.0) (2015-07-01)

[Full Changelog](https://github.com/jhoblitt/puppet-ganglia/compare/v1.5.0...v2.0.0)

**Closed issues:**

- Parse error when globals\_override\_hostname is not set [\#46](https://github.com/jhoblitt/puppet-ganglia/issues/46)
- unit tests should cover file content [\#2](https://github.com/jhoblitt/puppet-ganglia/issues/2)

**Merged pull requests:**

- v2.0.0 [\#55](https://github.com/jhoblitt/puppet-ganglia/pull/55) ([jhoblitt](https://github.com/jhoblitt))
- add preliminary el7.x support [\#54](https://github.com/jhoblitt/puppet-ganglia/pull/54) ([jhoblitt](https://github.com/jhoblitt))
- Added option mcast\_if for multicast configuration [\#53](https://github.com/jhoblitt/puppet-ganglia/pull/53) ([mrolli](https://github.com/mrolli))
- Fix line breaks if not using arrays for ds. [\#52](https://github.com/jhoblitt/puppet-ganglia/pull/52) ([mrolli](https://github.com/mrolli))
- Feature/puppet 4.0 [\#51](https://github.com/jhoblitt/puppet-ganglia/pull/51) ([jhoblitt](https://github.com/jhoblitt))

## [v1.5.0](https://github.com/jhoblitt/puppet-ganglia/tree/v1.5.0) (2015-04-16)

[Full Changelog](https://github.com/jhoblitt/puppet-ganglia/compare/v1.4.1...v1.5.0)

**Closed issues:**

- tax error at 'ganglia\_ip'; expected '}' at /etc/puppet/manifests/site.pp:96 on node puppet.com [\#38](https://github.com/jhoblitt/puppet-ganglia/issues/38)

**Merged pull requests:**

- Feature/v1.5.0 [\#49](https://github.com/jhoblitt/puppet-ganglia/pull/49) ([jhoblitt](https://github.com/jhoblitt))
- gmetad.conf - adding support for managing 'all\_trusted' and 'trusted\_hos... [\#48](https://github.com/jhoblitt/puppet-ganglia/pull/48) ([tskirvin](https://github.com/tskirvin))

## [v1.4.1](https://github.com/jhoblitt/puppet-ganglia/tree/v1.4.1) (2015-03-28)

[Full Changelog](https://github.com/jhoblitt/puppet-ganglia/compare/v1.4.0...v1.4.1)

**Closed issues:**

- Module ganglia is not supported on operatingsystemmajrelease 6 \(CentOS\) [\#41](https://github.com/jhoblitt/puppet-ganglia/issues/41)
- tax error at 'ganglia\_ip'; expected '}' at /etc/puppet/manifests/site.pp:96 on node puppet.com [\#39](https://github.com/jhoblitt/puppet-ganglia/issues/39)
- validate\_string fails for integer [\#28](https://github.com/jhoblitt/puppet-ganglia/issues/28)
- No returned value for puppet facts of 'operatingsystemmajrelease' in params.pp under centOS6.4\(minimal installed\) [\#21](https://github.com/jhoblitt/puppet-ganglia/issues/21)

**Merged pull requests:**

- Feature/v1.4.1 [\#47](https://github.com/jhoblitt/puppet-ganglia/pull/47) ([jhoblitt](https://github.com/jhoblitt))
- Fix web example in README [\#45](https://github.com/jhoblitt/puppet-ganglia/pull/45) ([cmurphy](https://github.com/cmurphy))
- ::lsbmajdistrelease is a string now [\#43](https://github.com/jhoblitt/puppet-ganglia/pull/43) ([drewr](https://github.com/drewr))
- Add fix for future parser in puppet 3.7.4 [\#42](https://github.com/jhoblitt/puppet-ganglia/pull/42) ([NoodlesNZ](https://github.com/NoodlesNZ))

## [v1.4.0](https://github.com/jhoblitt/puppet-ganglia/tree/v1.4.0) (2015-01-26)

[Full Changelog](https://github.com/jhoblitt/puppet-ganglia/compare/v1.3.0...v1.4.0)

**Closed issues:**

- undefined method `each' for nil:NilClass [\#25](https://github.com/jhoblitt/puppet-ganglia/issues/25)

**Merged pull requests:**

- Feature/v1.4.0 [\#40](https://github.com/jhoblitt/puppet-ganglia/pull/40) ([jhoblitt](https://github.com/jhoblitt))
- Feature/future parser [\#37](https://github.com/jhoblitt/puppet-ganglia/pull/37) ([jhoblitt](https://github.com/jhoblitt))
- exclude beaker gems from travis [\#36](https://github.com/jhoblitt/puppet-ganglia/pull/36) ([jhoblitt](https://github.com/jhoblitt))
- Fix problem with undef override\_hostname [\#34](https://github.com/jhoblitt/puppet-ganglia/pull/34) ([NoodlesNZ](https://github.com/NoodlesNZ))
- Added global\_override\_hostname [\#33](https://github.com/jhoblitt/puppet-ganglia/pull/33) ([NoodlesNZ](https://github.com/NoodlesNZ))
- Change ganglia\_port default to string [\#32](https://github.com/jhoblitt/puppet-ganglia/pull/32) ([NoodlesNZ](https://github.com/NoodlesNZ))
- Add simple test coverage of gmetad.conf template [\#31](https://github.com/jhoblitt/puppet-ganglia/pull/31) ([jhoblitt](https://github.com/jhoblitt))
- Additional work for PR \#18 [\#30](https://github.com/jhoblitt/puppet-ganglia/pull/30) ([NoodlesNZ](https://github.com/NoodlesNZ))
- Added additional parameters to gmetad [\#29](https://github.com/jhoblitt/puppet-ganglia/pull/29) ([NoodlesNZ](https://github.com/NoodlesNZ))
- Fix scope problem for gmetad config [\#27](https://github.com/jhoblitt/puppet-ganglia/pull/27) ([NoodlesNZ](https://github.com/NoodlesNZ))
- Feature/future parser [\#26](https://github.com/jhoblitt/puppet-ganglia/pull/26) ([jhoblitt](https://github.com/jhoblitt))
- Feature/beaker [\#23](https://github.com/jhoblitt/puppet-ganglia/pull/23) ([jhoblitt](https://github.com/jhoblitt))
- Update gmetad.conf and add custom RRAs [\#22](https://github.com/jhoblitt/puppet-ganglia/pull/22) ([NoodlesNZ](https://github.com/NoodlesNZ))
- Removes trailing whitespace [\#20](https://github.com/jhoblitt/puppet-ganglia/pull/20) ([g0xA52A2A](https://github.com/g0xA52A2A))
- Sets user to nobody on EL6 [\#19](https://github.com/jhoblitt/puppet-ganglia/pull/19) ([g0xA52A2A](https://github.com/g0xA52A2A))
- Add possibility to set ganglia-\>globals-\>{deaf, host\_dmax, send\_metadata\_interval} as well as use udp\_send\_channel-\>bind\_hostname [\#18](https://github.com/jhoblitt/puppet-ganglia/pull/18) ([goungy](https://github.com/goungy))
- Removed lies from gmetad config for el6 [\#17](https://github.com/jhoblitt/puppet-ganglia/pull/17) ([krunaldo](https://github.com/krunaldo))

## [v1.3.0](https://github.com/jhoblitt/puppet-ganglia/tree/v1.3.0) (2014-05-16)

[Full Changelog](https://github.com/jhoblitt/puppet-ganglia/compare/v1.2.2...v1.3.0)

**Closed issues:**

- Error installing on CentOS [\#12](https://github.com/jhoblitt/puppet-ganglia/issues/12)

**Merged pull requests:**

- bump version to v1.3.0 [\#15](https://github.com/jhoblitt/puppet-ganglia/pull/15) ([jhoblitt](https://github.com/jhoblitt))
- Feature/validate gmetad clusters [\#14](https://github.com/jhoblitt/puppet-ganglia/pull/14) ([jhoblitt](https://github.com/jhoblitt))
- Add IPv6 support for Debian based gmond [\#13](https://github.com/jhoblitt/puppet-ganglia/pull/13) ([xavpaice](https://github.com/xavpaice))

## [v1.2.2](https://github.com/jhoblitt/puppet-ganglia/tree/v1.2.2) (2013-12-26)

[Full Changelog](https://github.com/jhoblitt/puppet-ganglia/compare/v1.2.1...v1.2.2)

## [v1.2.1](https://github.com/jhoblitt/puppet-ganglia/tree/v1.2.1) (2013-12-26)

[Full Changelog](https://github.com/jhoblitt/puppet-ganglia/compare/v1.2.0...v1.2.1)

**Closed issues:**

- template varaible array issue [\#7](https://github.com/jhoblitt/puppet-ganglia/issues/7)

**Merged pull requests:**

- change gmond erb templates to gracefully handle nil variables [\#11](https://github.com/jhoblitt/puppet-ganglia/pull/11) ([jhoblitt](https://github.com/jhoblitt))

## [v1.2.0](https://github.com/jhoblitt/puppet-ganglia/tree/v1.2.0) (2013-12-21)

[Full Changelog](https://github.com/jhoblitt/puppet-ganglia/compare/v1.1.0...v1.2.0)

**Merged pull requests:**

- add debian support [\#10](https://github.com/jhoblitt/puppet-ganglia/pull/10) ([jhoblitt](https://github.com/jhoblitt))

## [v1.1.0](https://github.com/jhoblitt/puppet-ganglia/tree/v1.1.0) (2013-12-21)

[Full Changelog](https://github.com/jhoblitt/puppet-ganglia/compare/v1.0.2...v1.1.0)

**Closed issues:**

- duplicate declaration issue [\#8](https://github.com/jhoblitt/puppet-ganglia/issues/8)

**Merged pull requests:**

- add extremely basic rspec-system tests [\#9](https://github.com/jhoblitt/puppet-ganglia/pull/9) ([jhoblitt](https://github.com/jhoblitt))
- Ubuntu port [\#4](https://github.com/jhoblitt/puppet-ganglia/pull/4) ([kitchen](https://github.com/kitchen))

## [v1.0.2](https://github.com/jhoblitt/puppet-ganglia/tree/v1.0.2) (2013-12-10)

[Full Changelog](https://github.com/jhoblitt/puppet-ganglia/compare/v1.0.1...v1.0.2)

## [v1.0.1](https://github.com/jhoblitt/puppet-ganglia/tree/v1.0.1) (2013-10-14)

[Full Changelog](https://github.com/jhoblitt/puppet-ganglia/compare/v1.0.0...v1.0.1)

## [v1.0.0](https://github.com/jhoblitt/puppet-ganglia/tree/v1.0.0) (2013-09-21)

[Full Changelog](https://github.com/jhoblitt/puppet-ganglia/compare/v0.0.2...v1.0.0)

**Closed issues:**

- Puppet 3.0.1 and variable scope in the ERB templates [\#1](https://github.com/jhoblitt/puppet-ganglia/issues/1)

## [v0.0.2](https://github.com/jhoblitt/puppet-ganglia/tree/v0.0.2) (2013-03-03)

[Full Changelog](https://github.com/jhoblitt/puppet-ganglia/compare/v0.0.1...v0.0.2)

## [v0.0.1](https://github.com/jhoblitt/puppet-ganglia/tree/v0.0.1) (2012-11-16)

[Full Changelog](https://github.com/jhoblitt/puppet-ganglia/compare/760cf71b4f66c46713e58960d60aad0a10c50fcb...v0.0.1)



\* *This Changelog was automatically generated by [github_changelog_generator](https://github.com/github-changelog-generator/github-changelog-generator)*
