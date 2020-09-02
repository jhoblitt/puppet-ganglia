# frozen_string_literal: true

require 'spec_helper'

describe 'ganglia::gmetad' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }
      let(:params) do
        {
          :all_trusted => 'off'
        }
      end

      it { is_expected.to compile }

      it 'should manage gmetad.conf' do
        should contain_file('/etc/ganglia/gmetad.conf').with(
          :ensure => 'present',
          :owner  => 'root',
          :group  => 'root',
          :mode   => '0644'
        )
      end

      it { should contain_file('/etc/ganglia/gmetad.conf').that_notifies('Service[gmetad]') }

      it 'should have default values in gmetad.conf template' do
        should contain_file('/etc/ganglia/gmetad.conf').
          with_content(/^data_source "my cluster" localhost$/).
          with_content(/^RRAs "RRA:AVERAGE:0.5:1:5856" "RRA:AVERAGE:0.5:4:20160" "RRA:AVERAGE:0.5:40:52704" $/).
          with_content(/^# gridname "MyGrid"$/).
          with_content(/^setuid_username "ganglia"$/).
          with_content(/^case_sensitive_hostnames 0$/)
      end

      it 'should disable all_trusted' do
        should contain_file('/etc/ganglia/gmetad.conf').
          with_content(/^all_trusted off$/)
      end

      context "with all_trusted on" do
        let(:params) do
          super().merge({
            'all_trusted' => 'on' 
          })
        end
        it 'should enable all_trusted' do
          should contain_file('/etc/ganglia/gmetad.conf').
            with_content(/^all_trusted on$/)
        end
      end
    end
  end
end
