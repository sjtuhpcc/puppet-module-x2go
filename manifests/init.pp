# == Class: x2go
#
# See README.md for more details.
class x2go (
  $server                         = true,
  $server_package_name            = $x2go::params::server_package_name,
  $server_xsession_package_name   = $x2go::params::server_xsession_package_name,
  $x2gocleansessions_service_name = $x2go::params::x2gocleansessions_service_name,
) inherits x2go::params {

  validate_bool(
    $server
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
