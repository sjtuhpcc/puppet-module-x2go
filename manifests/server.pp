# Private class
class x2go::server {

  include x2go::server::install
  include x2go::server::config
  include x2go::server::service

  anchor { 'x2go::server::start': }
  anchor { 'x2go::server::end': }

  Anchor['x2go::server::start']->
  Class['x2go::server::install']->
  Class['x2go::server::config']->
  Class['x2go::server::service']->
  Anchor['x2go::server::end']


}
