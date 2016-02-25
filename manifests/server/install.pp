# Private class
class x2go::server::install {

  case $::osfamily {
    'RedHat': {
      include ::epel
      $_package_require = Yumrepo['epel']

      yum::group { $x2go::server_desktop_packages:
        ensure => 'present',
      }
    }
    default: {
      $_package_require = undef
    }
  }

  package { 'x2goserver':
    ensure  => 'present',
    name    => $x2go::server_package_name,
    require => $_package_require,
  }

  package { 'x2goserver-xsession':
    ensure  => 'present',
    name    => $x2go::server_xsession_package_name,
    require => $_package_require,
  }

}
