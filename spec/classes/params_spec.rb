require 'spec_helper'

describe 'ganglia::params', :type => :class do

  describe 'for osfamily RedHat' do
    let(:facts) {{ :osfamily => 'RedHat' }}

    describe 'el5.x' do
      before { facts[:operatingsystemmajrelease] = '5' }

      it { should include_class('ganglia::params') }
    end

    describe 'el6.x' do
      before { facts[:operatingsystemmajrelease] = '6' }
  
      it { should include_class('ganglia::params') }
    end

    describe 'el7.x+/fedora' do
      before { facts[:operatingsystemmajrelease] = '7' }

      it { should include_class('ganglia::params') }
    end

    describe 'el4.x' do
      before { facts[:operatingsystemmajrelease] = '4' }

      it 'should fail' do
        expect { should include_class('ganglia::params') }.
          to raise_error(Puppet::Error, /not supported on operatingsystemmajrelease/)
      end
    end
  end

  describe 'for osfamily debian' do
    let :facts do
      {
        :osfamily => 'Debian'
      }
    end

    describe 'for operatingsystem ubuntu' do
      before { facts[:operatingsystem] = 'Ubuntu' }

      it { should include_class('ganglia::params') }
    end

    describe 'for operatingsystem debian' do
      before { facts[:operatingsystem] = 'Debian' }

      it 'should fail' do
        expect { should include_class('ganglia::params') }.
          to raise_error(Puppet::Error, /not supported on .*Debian\/Debian/)
      end
    end
  end


  describe 'unsupported osfamily' do
    let :facts do 
      {
        :osfamily        => 'Solaris',
        :operatingsystem => 'Solaris',
      }
    end
  
    it 'should fail' do
      expect { should include_class('ganglia::params') }.
        to raise_error(Puppet::Error, /not supported on Solaris/)
    end
  end

end
