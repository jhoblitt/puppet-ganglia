require 'spec_helper'

describe 'ganglia::gmetad' do
  let(:facts) {{ :osfamily => 'RedHat', :operatingsystemmajrelease => 6 }}

  context 'clusters =>' do
    context '<good example>' do
      clusters = [
        { 
          'name'    => 'test', 
          'address' => ['test1.example.org', 'test2.example.org'],
        },
      ]

      let(:params) {{ :clusters => clusters }}
      it do
        should contain_class('ganglia::gmetad') 
        should contain_file('/etc/ganglia/gmetad.conf') 
      end
    end # <good example>

    context '[]' do
      let(:params) {{ :clusters => [] }}
      it do
        expect { should compile }.to raise_error(Puppet::Error, /Array may not be empty/)
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
        expect { should compile }.to raise_error(Puppet::Error, /unknown keys/)
      end
    end # <invalid example>
  end # clusters =>
end

