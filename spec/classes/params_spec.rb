require 'spec_helper'

describe 'ganglia::params', type: :class do
  describe 'for osfamily RedHat' do
    let(:facts) { { osfamily: 'RedHat' } }

    describe 'el5.x' do
      before(:each) { facts[:operatingsystemmajrelease] = '5' }

      it { is_expected.to contain_class('ganglia::params') }
    end

    describe 'el6.x' do
      before(:each) { facts[:operatingsystemmajrelease] = '6' }

      it { is_expected.to contain_class('ganglia::params') }
    end

    describe 'el7.x+/fedora' do
      before(:each) { facts[:operatingsystemmajrelease] = '7' }

      it { is_expected.to contain_class('ganglia::params') }
    end

    describe 'el8' do
      before(:each) { facts[:operatingsystemmajrelease] = '8' }

      it { is_expected.to contain_class('ganglia::params') }
    end

    describe 'el4.x' do
      before(:each) { facts[:operatingsystemmajrelease] = '4' }

      it 'fails' do
        expect { is_expected.to contain_class('ganglia::params') }
          .to raise_error(Puppet::Error, %r{not supported on operatingsystemmajrelease})
      end
    end
  end

  describe 'for osfamily debian' do
    let(:facts) { { osfamily: 'Debian' } }

    describe 'for operatingsystem debian' do
      before(:each) { facts[:operatingsystem] = 'Debian' }

      it { is_expected.to contain_class('ganglia::params') }
    end

    describe 'for operatingsystem ubuntu' do
      before(:each) do
        facts[:operatingsystem] = 'Ubuntu'
        facts[:lsbmajdistrelease] = '12'
      end

      it { is_expected.to contain_class('ganglia::params') }
    end
  end

  describe 'unsupported osfamily' do
    let :facts do
      {
        osfamily: 'Solaris',
        operatingsystem: 'Solaris',
      }
    end

    it 'fails' do
      expect { is_expected.to contain_class('ganglia::params') }
        .to raise_error(Puppet::Error, %r{not supported on Solaris})
    end
  end
end
