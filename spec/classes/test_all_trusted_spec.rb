# frozen_string_literal: true
# NOTE: Tests pass!

require 'spec_helper'

describe 'ganglia::gmetad' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }
      let(:params) do
        {
          :all_trusted => 'on'
        }
      end
      it 'should enable all_trusted' do
        should contain_file('/etc/ganglia/gmetad.conf').
          with_content(/^all_trusted on$/)
      end
    end
  end
end
