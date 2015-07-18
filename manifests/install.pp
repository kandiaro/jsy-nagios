class nagios::install (
  $ensure = $nagios::params::package_ensure,
  $epel = $nagios::paramas::epel,
  $package = $nagios::params::package 
) inherits ::nagios::params {
  if $epel {
    package {'epel-release':
    ensure => 'latest',
    before => Package[$package],
   }
  } 
 package {$package:
   ensure => $ensure,
   provider => $nagios::params::provider
 }
 notice("$package")
}
