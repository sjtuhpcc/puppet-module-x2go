# Private class
class x2go::server::service {

  service { 'x2gocleansessions':
    ensure     => 'running',
    enable     => true,
    name       => $x2go::x2gocleansessions_service_name,
    hasstatus  => true,
    hasrestart => true,
  }

  if $x2go::disable_network_manager {
    service { 'NetworkManager':
      ensure     => 'stopped',
      enable     => false,
      hasstatus  => true,
      hasrestart => true,
    }
  }

}
