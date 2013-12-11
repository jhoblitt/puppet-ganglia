require 'spec_helper'

describe 'ganglia::gmetad' do
  let(:facts) {{ :osfamily => 'RedHat', :operatingsystemmajrelease => 6 }}

  context 'with clusters' do
    clusters = [
      { 
        'name'    => 'test', 
        'address' => ['test1.example.org', 'test2.example.org'],
      },
    ]

    let(:params) { {:clusters => clusters} }
    it do
      should contain_class('ganglia::gmetad') 
      should contain_file('/etc/ganglia/gmetad.conf') 
    end
  end
end

