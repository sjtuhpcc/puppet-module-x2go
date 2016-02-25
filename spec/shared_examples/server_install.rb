shared_examples 'x2go::server::install' do |facts|

  if facts[:osfamily] == 'RedHat'
    let(:package_require) { 'Yumrepo[epel]' }

    it { is_expected.to contain_class('epel') }

    it { is_expected.to contain_yum__group('General Purpose Desktop').with_ensure('present') }
    it { is_expected.to contain_yum__group('Desktop').with_ensure('present') }
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
