require 'spec_helper'

describe 'bashrc', :type => 'class' do
  context 'on supported platforms' do
    let :facts do { :osfamily => 'RedHat'} end
    it { should include_class('bashrc::rhel') }
    end
end