require 'spec_helper'

describe 'ganglia::web' do
  let(:facts) { { osfamily: 'RedHat', operatingsystemmajrelease: '8', puppetversion: Puppet.version } }

  context 'parameters' do
    context 'with out params' do
      it do
        is_expected.to contain_file('/etc/ganglia/conf.php')
          .with_content(%r{\$conf\['ganglia_port'\] = 8652;})
      end
    end

    context 'ganglia_port' do
      context 'Integer' do
        let(:params) { { ganglia_port: 42 } }

        it do
          is_expected.to contain_file('/etc/ganglia/conf.php')
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
