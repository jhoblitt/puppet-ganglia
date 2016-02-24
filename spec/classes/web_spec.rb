require 'spec_helper'

describe 'ganglia::web' do
  let(:facts) {{ :osfamily => 'RedHat', :operatingsystemmajrelease => '6', :puppetversion => Puppet.version }}

  context 'parameters' do
    context 'with out params' do
      it do
        should contain_file('/etc/ganglia/conf.php').
          with_content(/\$conf\['ganglia_port'\] = 8652;/)
      end
    end

    context 'ganglia_port' do
      context 'Integer' do
        let(:params) {{ :ganglia_port => 42 }}

        it do
          should contain_file('/etc/ganglia/conf.php').
            with_content(/\$conf\['ganglia_port'\] = 42;/)
        end
      end #Integer

      context 'String' do
        let(:params) {{ :ganglia_port => '42' }}

        it do
          should contain_file('/etc/ganglia/conf.php').
            with_content(/\$conf\['ganglia_port'\] = 42;/)
        end

        it 'should be deprecated' do
          pending 'https://github.com/rodjek/rspec-puppet/issues/310'
          scope.expects(:warning).with('Passing a String to $ganglia_port is deprecated.  Please use an Integer value.')
        end
      end #Integer
    end # ganglia_port
  end # parameters
end
