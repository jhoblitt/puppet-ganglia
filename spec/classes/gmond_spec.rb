require 'spec_helper'

describe 'ganglia::gmond' do
  let(:facts) {{ :osfamily => 'RedHat', :operatingsystemmajrelease => 6 }}

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
end

