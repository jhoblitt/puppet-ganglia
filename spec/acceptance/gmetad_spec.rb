require 'spec_helper_acceptance'

describe 'ganglia::gmetad class' do
  case fact 'osfamily'
  when 'RedHat'
    package_name = 'ganglia-gmetad'
    service_name = 'gmetad'
  when 'Debian'
    package_name = 'gmetad'
    service_name = 'gmetad'
  end

  describe 'running puppet code' do
    pp = <<-EOS
      if $::osfamily == 'RedHat' {
        class { 'epel': } -> Class['ganglia::gmetad']
      }
      class { 'ganglia::gmetad': }
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
    it { should be_running }
    it { should be_enabled }
  end
end
