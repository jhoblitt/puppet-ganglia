require 'spec_helper'

describe 'ganglia::web' do
  let(:title) { 'redhat' }
  let(:facts) { {:osfamily=> 'RedHat'} }

  context 'with out params' do
    let(:params) { { } }
    it do
      should include_class('ganglia::web') 
      should contain_file('/etc/ganglia/conf.php') 
    end
  end
end

