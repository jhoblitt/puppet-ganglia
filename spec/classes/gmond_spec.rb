require 'spec_helper'

describe 'ganglia::gmond' do
  let(:facts) {{ :osfamily => 'RedHat', :operatingsystemmajrelease => '6', :puppetversion => Puppet.version }}

  context 'default params' do
    it 'should manage gmond.conf' do
      should contain_file('/etc/ganglia/gmond.conf').with(
        :ensure => 'present',
        :owner  => 'root',
        :group  => 'root',
        :mode   => '0644'
      )
    end

    it do
      should contain_file('/etc/ganglia/gmond.conf').
        that_notifies('Service[gmond]')
      should contain_package('ganglia-gmond').
        with_ensure('present')
    end

    it 'should have default values in gmond.conf template' do
      should contain_file('/etc/ganglia/gmond.conf').
        with_content(/^  deaf = no$/).
        with_content(/^  host_dmax = 0 /).
        with_content(/^  send_metadata_interval = 300 /).
        with_content(/^  name = "unspecified"$/).
        with_content(/^  owner = "unspecified"$/).
        with_content(/^  latlong = "unspecified"$/).
        with_content(/^  url = "unspecified"$/).
        with_content(/^  location = "unspecified"$/).
        without_content(/^  override_hostname =/).
        without_content(/^  mcast_if/)
    end
  end # default params

  context 'with lots of params' do
    udp_recv_channel = [
      {'port' => 8649, 'bind' => 'localhost'},
      {'port' => 8649, 'bind' => '0.0.0.0'},
    ]
    udp_send_channel = [
      {'port' => 8649, 'host' => 'test1.example.org', 'ttl' => 2},
      {'port' => 8649, 'host' => 'test2.example.org', 'ttl' => 2},
    ]
    tcp_accept_channel = [
      {'port' => 8649},
    ]
    params = {
      'cluster_name'        => "example grid",
      'cluster_owner'       => "ACME, Inc.",
      'cluster_latlong'     => "N32.2332147 W110.9481163",
      'cluster_url'         => "www.example.org",
      'host_location'       => "Example Computer Room",
      'udp_recv_channel'    => udp_recv_channel,
      'udp_send_channel'    => udp_send_channel,
      'tcp_accept_channel'  => tcp_accept_channel,
    }

    let(:params) { params }
    it do
      should contain_class('ganglia::gmond')
      should contain_file('/etc/ganglia/gmond.conf')
    end
  end

  context 'with multicast channels' do
    udp_recv_channel = [
      {'port' => 8649, 'mcast_join' => '239.2.11.72', 'mcast_if' => 'eth0', 'bind' => '239.2.11.72'},
    ]
    udp_send_channel = [
      {'port' => 8649, 'mcast_join' => '239.2.11.72', 'mcast_if' => 'eth0', 'ttl' => '1', 'bind_hostname' => 'yes'},
    ]
    tcp_accept_channel = [
      {'port' => 8649},
    ]
    params = {
      'cluster_name'        => "example grid",
      'cluster_owner'       => "ACME, Inc.",
      'cluster_latlong'     => "N32.2332147 W110.9481163",
      'cluster_url'         => "www.example.org",
      'host_location'       => "Example Computer Room",
      'udp_recv_channel'    => udp_recv_channel,
      'udp_send_channel'    => udp_send_channel,
      'tcp_accept_channel'  => tcp_accept_channel,
    }

    let(:params) { params }
    it do
      should contain_class('ganglia::gmond')
      should contain_file('/etc/ganglia/gmond.conf').
        with_content(/^\s*bind_hostname\s+=\s+yes/).
        with_content(/^\s*mcast_join\s+=\s+239\.2\.11\.72/).
        with_content(/^\s*mcast_if\s+=\s+eth0/).
        with_content(/^\s*port\s+=\s+8649/).
        with_content(/^\s*ttl\s+=\s+1/)
    end
  end

  context 'with gmond_package_name' do
    gmond_package_name = [ 'ganglia-gmond', 'ganglia-gmond-python' ]
    params = {
      'gmond_package_name'  => gmond_package_name,
    }

    let(:params) { params }
    it do
      should contain_package('ganglia-gmond').
        with_ensure('present')
      should contain_package('ganglia-gmond-python').
        with_ensure('present')
    end
  end
end
