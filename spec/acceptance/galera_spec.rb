require 'spec_helper_acceptance'

describe 'bootstrap galera' do
  it 'should work with no errors' do
    pp = <<-EOS
      class { 'galera':
        galera_servers => [$::ipaddress, '192.168.99.102'],
        galera_master  => $::fqdn,
      }
    EOS

    # Run it twice and test for idempotency
    apply_manifest(pp, :catch_failures => true)
    expect(apply_manifest(pp, :catch_failures => true).exit_code).to be_zero
  end
end
