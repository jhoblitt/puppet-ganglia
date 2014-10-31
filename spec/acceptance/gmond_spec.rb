require 'spec_helper_acceptance'

describe 'ganglia::gmond class' do
  case fact 'osfamily'
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
    pp = <<-EOS
      if $::osfamily == 'RedHat' {
        class { 'epel': } -> Class['ganglia::gmond']
      }
      class { 'ganglia::gmond': }
    EOS

    it 'applies the manifest twice with no stderr' do
      apply_manifest(pp, :catch_failures => true)
      apply_manifest(pp, :catch_changes => true)
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
