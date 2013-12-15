require 'spec_helper'

describe 'ganglia::params', :type => :class do

  describe 'for osfamily RedHat' do
    let(:facts) {{ :osfamily => 'RedHat' }}

    describe 'el5.x' do
      before { facts[:operatingsystemmajrelease] = '5' }

      it { should contain_class('ganglia::params') }
    end

    describe 'el6.x' do
      before { facts[:operatingsystemmajrelease] = '6' }
  
      it { should contain_class('ganglia::params') }
    end

    describe 'el7.x+/fedora' do
      before { facts[:operatingsystemmajrelease] = '7' }

      it { should contain_class('ganglia::params') }
    end

    describe 'el4.x' do
      before { facts[:operatingsystemmajrelease] = '4' }

      it 'should fail' do
        expect { should contain_class('ganglia::params') }.
          to raise_error(Puppet::Error, /not supported on operatingsystemmajrelease/)
      end
    end
  end

  describe 'unsupported osfamily' do
    let :facts do 
      {
        :osfamily        => 'Debian',
        :operatingsystem => 'Debian',
      }
    end
  
    it 'should fail' do
      expect { should contain_class('ganglia::params') }.
        to raise_error(Puppet::Error, /not supported on Debian/)
    end
  end

end
