shared_examples 'x2go::server::install' do |facts|

  if facts[:osfamily] == 'RedHat'
    let(:package_require) { 'Yumrepo[epel]' }
  end

  it do
    is_expected.to contain_package('x2goserver').with({
      :ensure   => 'present',
      :name     => 'x2goserver',
      :require  => package_require,
    })
  end

  it do
    is_expected.to contain_package('x2goserver-xsession').with({
      :ensure   => 'present',
      :name     => 'x2goserver-xsession',
      :require  => package_require,
    })
  end

end
