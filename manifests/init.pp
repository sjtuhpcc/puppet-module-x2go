# == Class: x2go
#
# See README.md for more details.
class x2go (
  $server                         = true,
  $server_desktop_packages        = $x2go::params::server_desktop_packages,
  $server_package_name            = $x2go::params::server_package_name,
  $server_xsession_package_name   = $x2go::params::server_xsession_package_name,
  $x2gocleansessions_service_name = $x2go::params::x2gocleansessions_service_name,
  $disable_network_manager        = $x2go::params::disable_network_manager,
) inherits x2go::params {

  validate_bool(
    $server,
    $disable_network_manager
  )

  anchor { 'x2go::start': }
  anchor { 'x2go::end': }

  if $server {
    include x2go::server

    Anchor['x2go::start']->
    Class['x2go::server']->
    Anchor['x2go::end']
  }

}
