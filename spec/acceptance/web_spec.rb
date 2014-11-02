require 'spec_helper_acceptance'

describe 'ganglia::web class' do
  case fact 'osfamily'
  when 'RedHat'
    package_name = 'ganglia-web'
  when 'Debian'
    package_name = 'ganglia-webfrontend'
  end

  describe 'running puppet code' do
    pp = <<-EOS
      if $::osfamily == 'RedHat' {
        class { 'epel': } -> Class['ganglia::web']
      }
      class { 'ganglia::web': }
    EOS

    it 'applies the manifest twice with no stderr' do
      apply_manifest(pp, :catch_failures => true)
      apply_manifest(pp, :catch_changes => true)
    end
  end

  describe package(package_name) do
    it { should be_installed }
  end

end
