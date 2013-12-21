require 'spec_helper_system'

describe 'ganglia::gmetad class' do
  case node.facts['osfamily']
  when 'RedHat'
    package_name = 'ganglia-gmetad'
    service_name = 'gmetad'
  when 'Debian'
    package_name = 'gmetad'
    service_name = 'gmetad'
  end

  describe 'running puppet code' do
    # Using puppet_apply as a helper
    it 'should work with no errors' do
      pp = <<-EOS
        if $::osfamily == 'RedHat' {
          class { 'epel': } -> Class['ganglia::gmetad']
        }
        class { 'ganglia::gmetad': }
      EOS

      # Run it twice and test for idempotency
      puppet_apply(pp) do |r|
        r.exit_code.should_not == 1
        r.refresh
        r.exit_code.should be_zero
      end
    end
  end

  describe package(package_name) do
    it { should be_installed }
  end

  describe service(service_name) do
    it { should be_running }
    it { should be_enabled }
  end
end
