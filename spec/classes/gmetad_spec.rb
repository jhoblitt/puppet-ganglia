# frozen_string_literal: true

require 'spec_helper'

describe 'ganglia::gmetad' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      # Default tests
      it { is_expected.to compile }

      it 'manages gmetad.conf' do
        is_expected.to contain_file('/etc/ganglia/gmetad.conf').with(
          ensure: 'present',
          owner: 'root',
          group: 'root',
          mode: '0644',
        )
      end

      # it { should contain_file('/etc/ganglia/gmetad.conf').that_notifies('Service[gmetad]') }

      it 'has default values in gmetad.conf template' do
        is_expected.to contain_file('/etc/ganglia/gmetad.conf')
          .with_content(%r{^data_source "my cluster" localhost$})
          .with_content(%r{^RRAs "RRA:AVERAGE:0.5:1:5856" "RRA:AVERAGE:0.5:4:20160" "RRA:AVERAGE:0.5:40:52704" $})
          .with_content(%r{^# gridname "MyGrid"$})
          .that_notifies('Service[gmetad]')
      end

      it 'disables all_trusted' do
        is_expected.to contain_file('/etc/ganglia/gmetad.conf')
          .with_content(%r{^all_trusted off$})
      end

      context 'with all_trusted on' do
        let(:params) do
          {
            'all_trusted' => 'on',
          }
        end

        it 'enables all_trusted' do
          is_expected.to contain_file('/etc/ganglia/gmetad.conf')
            .with_content(%r{^all_trusted on$})
        end
      end

      # OS Specific tests
      case os_facts[:osfamily]
      when 'Debian'
        it 'has Debian default values in gmetad.conf template' do
          is_expected.to contain_file('/etc/ganglia/gmetad.conf')
            .with_content(%r{^case_sensitive_hostnames 1$})
            .with_content(%r{^setuid_username "nobody"$})
        end
      when 'RedHat'
        it 'has RedHat default values on in gmetad.conf template' do
          is_expected.to contain_file('/etc/ganglia/gmetad.conf')
            .with_content(%r{^case_sensitive_hostnames 0$})
            .with_content(%r{^setuid_username "ganglia"$})
        end
      end

      # Truested Hosts test
      context 'trusted_hosts' do
        context 'default' do
          it 'has an empty trusted_hosts' do
            is_expected.to contain_file('/etc/ganglia/gmetad.conf')
              .with_content(%r{^# trusted_hosts.*$})
              .without_content(%r{^trusted_hosts.*$})
          end
        end

        context 'trusted_hosts list' do
          let(:params) do
            {
              trusted_hosts: ['1', '2'],
            }
          end

          it 'enables trusted hosts' do
            is_expected.to contain_file('/etc/ganglia/gmetad.conf')
              .with_content(%r{^trusted_hosts 1 2$})
          end
        end
      end

      # Hostname Case checks
      context 'gmetad_hostnames_case' do
        [0, 1].each do |value|
          context 'good value' do
            let(:params) { { gmetad_hostnames_case: value } }

            it do
              is_expected.to contain_file('/etc/ganglia/gmetad.conf')
                .with_content(%r{^case_sensitive_hostnames #{value}$})
            end
          end
        end

        [-1, 2].each do |value|
          context 'bad value' do
            let(:params) { { gmetad_hostnames_case: value } }

            it do
              is_expected.to raise_error(Puppet::Error, %r{got Integer})
            end
          end
        end
      end

      # Cluster Based Tests
      context 'clusters =>' do
        context '<good example>' do
          clusters = [
            {
              'name'    => 'test',
              'address' => ['test1.example.org', 'test2.example.org'],
            },
          ]

          let(:params) { { clusters: clusters } }

          it 'has data_source in template' do
            is_expected.to contain_file('/etc/ganglia/gmetad.conf')
              .with_content(%r{^data_source "test" test1.example.org test2.example.org$})
          end
        end

        context '[]' do
          let(:params) { { clusters: [] } }

          it 'is expected to fail with wrong size' do
            is_expected.to raise_error(Puppet::Error, %r{expects size to be 1, got 0})
          end
        end

        context '<invalid example>' do
          let(:params) do
            {
              clusters: [
                {
                  'name'    => 'test',
                  'address' => ['test1.example.org', 'test2.example.org'],
                  'foo'     => 1,
                },
              ],
            }
          end

          it 'is expected to fail with unknown keys' do
            is_expected.to raise_error(Puppet::ParseError, %r{unknown keys})
          end
        end
      end
    end
  end
end
