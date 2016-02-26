require 'spec_helper_acceptance'

describe 'x2go class' do
  context 'default parameters' do
    it 'should run successfully' do
      pp =<<-EOS
        class { 'x2go': }
      EOS

      apply_manifest(pp, :catch_failures => true)
      apply_manifest(pp, :catch_changes => false)
    end

    describe package('x2goserver') do
      it { should be_installed }
    end

    describe package('x2goserver-xsession') do
      it { should be_installed }
    end

    describe service('x2gocleansessions') do
      it { should be_enabled }
      it { should be_running }
    end

  end
end
