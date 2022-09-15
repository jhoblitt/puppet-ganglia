# frozen_string_literal: true

require 'spec_helper'

describe 'ganglia::params', type: :class do
  describe 'for osfamily RedHat' do
    let(:facts) do
      {
        os: {
          'family' => 'RedHat',
          'name' => 'CentOS',
          'release' => {
            'major' => '6',
          }
        }
      }
    end

    describe 'el7.x+/fedora' do
      before { facts[:os]['release']['major'] = '7' }

      it { is_expected.to contain_class('ganglia::params') }
    end

    describe 'el8' do
      before { facts[:os]['release']['major'] = '8' }

      it { is_expected.to contain_class('ganglia::params') }
    end

    describe 'el4.x' do
      before { facts[:os]['release']['major'] = '4' }

      it 'fails' do
        expect { is_expected.to contain_class('ganglia::params') }.
          to raise_error(Puppet::Error, %r{not supported on os.release.major})
      end
    end
  end

  describe 'for osfamily debian' do
    let(:facts) { { os: { 'family' => 'Debian' } } }

    describe 'for operatingsystem debian' do
      before { facts[:os]['name'] = 'Debian' }

      it { is_expected.to contain_class('ganglia::params') }
    end

    describe 'for operatingsystem ubuntu' do
      before do
        facts[:operatingsystem] = 'Ubuntu'
        facts[:lsbmajdistrelease] = '12'
      end

      it { is_expected.to contain_class('ganglia::params') }
    end
  end

  describe 'unsupported osfamily' do
    let :facts do
      {
        os: {
          family: 'Solaris',
          name: 'Solaris',
        }
      }
    end

    it 'fails' do
      expect { is_expected.to contain_class('ganglia::params') }.
        to raise_error(Puppet::Error, %r{not supported on os.family Solaris})
    end
  end
end
