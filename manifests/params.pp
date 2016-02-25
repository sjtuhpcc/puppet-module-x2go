# The x2go default configuration settings.
class x2go::params {

  case $::osfamily {
    'RedHat': {
      $server_desktop_packages        = [ 'General Purpose Desktop', 'Desktop' ]
      $server_package_name            = 'x2goserver'
      $server_xsession_package_name   = 'x2goserver-xsession'
      $x2gocleansessions_service_name = 'x2gocleansessions'

      # Disable NetworkManager on >= EL6
      if versioncmp($::operatingsystemmajrelease, '6') < 1 {
        $disable_network_manager = true
      } else {
        $disable_network_manager = false
      }

    }

    default: {
      fail("Unsupported osfamily: ${::osfamily}, module ${module_name} only supports osfamily RedHat")
    }
  }

}
