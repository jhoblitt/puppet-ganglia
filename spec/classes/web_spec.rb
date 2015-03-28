require 'spec_helper'

describe 'ganglia::web' do
  let(:facts) {{ :osfamily => 'RedHat', :operatingsystemmajrelease => '6' }}

  context 'with out params' do
    let(:params) { { } }
    it do
      should contain_class('ganglia::web') 
      should contain_file('/etc/ganglia/conf.php') 
    end
  end
end

