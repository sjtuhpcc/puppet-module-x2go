# Private class
class x2go::server::config {

  # Remove sudo file shipped with x2goserver
  file { '/etc/sudoers.d/x2goserver': ensure => 'absent' }

  sudo::conf { 'x2goserver':
    content => 'Defaults env_keep +="QT_GRAPHICSSYSTEM"'
  }

}
