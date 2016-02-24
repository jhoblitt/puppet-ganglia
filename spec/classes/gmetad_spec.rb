require 'spec_helper'

shared_examples 'RedHat 6.x' do
  context 'default params' do
    it 'should manage gmetad.conf' do
      should contain_file('/etc/ganglia/gmetad.conf').with(
        :ensure => 'present',
        :owner  => 'root',
        :group  => 'root',
        :mode   => '0644'
      )
    end

    it do
      should contain_file('/etc/ganglia/gmetad.conf').
        that_notifies('Service[gmetad]')
    end

    it 'should have default values in gmetad.conf template' do
      should contain_file('/etc/ganglia/gmetad.conf').
        with_content(/^data_source "my cluster" localhost$/).
        with_content(/^RRAs "RRA:AVERAGE:0.5:1:5856" "RRA:AVERAGE:0.5:4:20160" "RRA:AVERAGE:0.5:40:52704" $/).
        with_content(/^# gridname "MyGrid"$/).
        with_content(/^setuid_username "ganglia"$/).
        with_content(/^case_sensitive_hostnames 0$/)
    end
  end # default params

  context 'all_trusted' do
    context 'default' do
      it 'should disable all_trusted' do
        should contain_file('/etc/ganglia/gmetad.conf').
          with_content(/^all_trusted off$/)
      end # should disable all_trusted
    end # default

    context 'all_trusted true' do
      let(:params) {{ :all_trusted => true }}
      it 'should enable all_trusted' do
        should contain_file('/etc/ganglia/gmetad.conf').
          with_content(/^all_trusted on$/)
      end
    end # all_trusted true
  end # all_trusted

  context 'trusted_hosts' do
    context 'default' do
      it 'should have an empty trusted_hosts' do
        should contain_file('/etc/ganglia/gmetad.conf').
          with_content(/^# trusted_hosts.*$/).
          without_content(/^trusted_hosts.*$/)
      end
    end # default

    context 'trusted_hosts list' do
      let(:params) {{ :trusted_hosts => [ '1', '2' ] }}
      it 'should enable trusted hosts' do
        should contain_file('/etc/ganglia/gmetad.conf').
          with_content(/^trusted_hosts 1 2$/)
      end
    end # trusted_hosts list
  end # trusted_hosts

  context 'clusters =>' do
    context '<good example>' do
      clusters = [
        {
          'name'    => 'test',
          'address' => ['test1.example.org', 'test2.example.org'],
        },
      ]

      let(:params) {{ :clusters => clusters }}

      it 'should have data_source in template' do
        should contain_file('/etc/ganglia/gmetad.conf').
          with_content(/^data_source "test" test1.example.org test2.example.org$/)
      end
    end # <good example>

    context '[]' do
      let(:params) {{ :clusters => [] }}
      it do
        should raise_error(Puppet::Error, /Array may not be empty/)
      end
    end # <invalid example>

    context '<invalid example>' do
      clusters = [
        {
          'name'    => 'test',
          'address' => ['test1.example.org', 'test2.example.org'],
          'foo'     => 1,
        },
      ]

      let(:params) {{ :clusters => clusters }}
      it do
        should raise_error(Puppet::Error, /unknown keys/)
      end
    end # <invalid example>
  end # clusters =>

  context 'gmetad_case_sensitive_hostnames' do
    context 'default' do
      it 'should have an empty trusted_hosts' do
        should contain_file('/etc/ganglia/gmetad.conf').
          with_content(/^case_sensitive_hostnames 0$/)
      end
    end # default

    [0, 1].each do |value|
      context 'good value' do
        let(:params) {{ :gmetad_case_sensitive_hostnames => value }}

        it do
          should contain_file('/etc/ganglia/gmetad.conf').
            with_content(/^case_sensitive_hostnames #{value}$/)
        end
      end
    end # good value

    [-1, 2].each do |value|
      context 'bad value' do
        let(:params) {{ :gmetad_case_sensitive_hostnames => value }}

        it do
          should raise_error(Puppet::Error,
            /(to be greater or equal to 0|to be smaller or equal to 1)/)
        end
      end
    end # value
  end # gmetad_case_sensitive_hostnames
end # RedHat

describe 'ganglia::gmetad' do
  context 'RedHat' do
    %w{6 7}.each do |rel|
      context rel do
        let(:facts) {{ :osfamily => 'RedHat', :operatingsystemmajrelease => rel, :puppetversion => Puppet.version }}

        it_behaves_like 'RedHat 6.x'
      end
    end
  end
end
