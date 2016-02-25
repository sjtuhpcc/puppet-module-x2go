# Private class
class x2go::server::config {

  sudo::conf { 'x2goserver':
    content => 'Defaults env_keep +="QT_GRAPHICSSYSTEM"'
  }

}
