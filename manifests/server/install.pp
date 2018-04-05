# Private class
class x2go::server::install {

  package { 'x2goserver':
    ensure  => 'present',
    name    => $x2go::server_package_name,
  }

  package { 'x2goserver-xsession':
    ensure  => 'present',
    name    => $x2go::server_xsession_package_name,
  }

}
