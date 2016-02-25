shared_examples 'x2go::server::service' do |facts|

  it do
    is_expected.to contain_service('x2gocleansessions').with({
      :ensure       => 'running',
      :enable       => 'true',
      :name         => 'x2gocleansessions',
      :hasstatus    => 'true',
      :hasrestart   => 'true',
    })
  end

  if facts[:osfamily] == 'RedHat' && facts[:operatingsystemmajrelease] < '7'
    it { is_expected.to contain_service('NetworkManager').with_ensure('stopped').with_enable('false') }
  else
    it { is_expected.not_to contain_service('NetworkManager') }
  end

end
