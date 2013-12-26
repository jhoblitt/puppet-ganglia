require 'spec_helper_system'

describe 'ganglia::gmond class' do
  case node.facts['osfamily']
  when 'RedHat'
    package_name = 'ganglia-gmond'
    service_name = 'gmond'
    daemon_name  = 'gmond'
  when 'Debian'
    # Amazingly, the init script is named ganglia-monitor while the daemon runs
    # with the executable name of gmond.
    package_name = 'ganglia-monitor'
    service_name = 'ganglia-monitor'
    daemon_name  = 'gmond'
  end

  describe 'running puppet code' do
    # Using puppet_apply as a helper
    it 'should work with no errors' do
      pp = <<-EOS
        if $::osfamily == 'RedHat' {
          class { 'epel': } -> Class['ganglia::gmond']
        }
        class { 'ganglia::gmond': }
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
    it { should be_enabled }
  end

  describe service(daemon_name) do
    it { should be_running }
  end

  # default udp_recv_channel
  describe port(8649) do
    it { should be_listening.with('udp') }
  end

  # default tcp_accept_channel
  describe port(8659) do
    it { should be_listening.with('tcp') }
  end

end
