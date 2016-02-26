require 'spec_helper'

describe 'x2go' do
  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) do
        if facts[:osfamily] == "RedHat"
          if facts[:operatingsystemmajrelease] == '6'
            facts.merge({:sudoversion => '1.8.6p3'})
          elsif facts[:operatingsystemmajrelease] == '7'
            facts.merge({:sudoversion => '1.8.6p7'})
          else
            facts
          end
        else
          facts
        end
      end

      it { is_expected.to compile.with_all_deps }
      it { is_expected.to create_class('x2go') }
      it { is_expected.to contain_class('x2go::params') }
      it { is_expected.to contain_anchor('x2go::start').that_comes_before('Class[x2go::server]') }
      it { is_expected.to contain_class('x2go::server').that_comes_before('Anchor[x2go::end]') }
      it { is_expected.to contain_anchor('x2go::end') }

      it_behaves_like 'x2go::server', facts

    end # end context
  end # end on_supported_os
end # end describe
