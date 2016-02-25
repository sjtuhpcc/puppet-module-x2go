shared_examples 'x2go::server' do |facts|

  it { is_expected.to create_class('x2go::server') }
  it { is_expected.to contain_anchor('x2go::server::start').that_comes_before('Class[x2go::server::install]') }
  it { is_expected.to contain_class('x2go::server::install').that_comes_before('Class[x2go::server::config]') }
  it { is_expected.to contain_class('x2go::server::config').that_comes_before('Class[x2go::server::service]') }
  it { is_expected.to contain_class('x2go::server::service').that_comes_before('Anchor[x2go::server::end]') }
  it { is_expected.to contain_anchor('x2go::server::end') }

  it_behaves_like 'x2go::server::install', facts
  it_behaves_like 'x2go::server::config', facts
  it_behaves_like 'x2go::server::service', facts

end
