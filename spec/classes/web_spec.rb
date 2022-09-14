require 'spec_helper'

describe 'ganglia::web' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      conf_file = case os_facts[:os]['family']
      when 'RedHat'
        '/etc/ganglia/conf.php'
      when 'Debian'
        '/usr/share/ganglia-webfrontend/conf.php'
      end

      context 'parameters' do
        context 'with out params' do
          it do
            is_expected.to contain_file(conf_file)
              .with_content(%r{\$conf\['ganglia_port'\] = 8652;})
          end
        end

        context 'ganglia_port' do
          context 'Integer' do
            let(:params) { { ganglia_port: 42 } }

            it do
              is_expected.to contain_file(conf_file)
                .with_content(%r{\$conf\['ganglia_port'\] = 42;})
            end
          end # Integer

          context 'String' do
            let(:params) { { ganglia_port: '42' } }

            it 'is expected to fail with expected Integer' do
              is_expected.to raise_error(Puppet::PreformattedError, %r{expects an Integer value})
            end
          end
        end # ganglia_port
      end # parameters
    end
  end
end
