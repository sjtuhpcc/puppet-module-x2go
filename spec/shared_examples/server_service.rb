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

end
