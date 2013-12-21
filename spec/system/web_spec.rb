require 'spec_helper_system'

describe 'ganglia::web class' do
  case node.facts['osfamily']
  when 'RedHat'
    package_name = 'ganglia-web'
  when 'Debian'
    package_name = 'ganglia-webfrontend'
  end

  describe 'running puppet code' do
    # Using puppet_apply as a helper
    it 'should work with no errors' do
      pp = <<-EOS
        if $::osfamily == 'RedHat' {
          class { 'epel': } -> Class['ganglia::web']
        }
        class { 'ganglia::web': }
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

end
