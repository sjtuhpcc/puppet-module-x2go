# The x2go default configuration settings.
class x2go::params {

  case $::osfamily {
    'RedHat': {
      $server_package_name            = 'x2goserver'
      $server_xsession_package_name   = 'x2goserver-xsession'
      $x2gocleansessions_service_name = 'x2gocleansessions'
    }

    default: {
      fail("Unsupported osfamily: ${::osfamily}, module ${module_name} only supports osfamily RedHat")
    }
  }

}
