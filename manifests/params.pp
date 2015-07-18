class nagios::params {
  $package_ensure = 'latest'
  $epel = true
  notice($::osfamily)
  
  case $::osfamily {
    'RedHat': {
      case $::operatingsystem {
        'CentOS': {
          $package = 'nagios'
          $provider = yum
          notice("CentOS")
         }
         default: { notice("Not supported RHEL") }
      }
    }
    'Debian': {
      case $::operatingsystem {  
        'Ubuntu': {
           $package = 'nagios3'
           $provider = apt
           notice("Ubuntu")
         }
        default: { notice("Not supported Debian") }
      }
     }
    default: { notice("Not supported") }
  }
}
