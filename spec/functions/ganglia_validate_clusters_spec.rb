require 'spec_helper'

describe 'ganglia_validate_clusters', type: :puppet_function do
  it 'fails with no params' do
    is_expected.to run.with_params
                      .and_raise_error(Puppet::ParseError, %r{wrong number of arguments})
  end

  it 'fails with > 1 param' do
    is_expected.to run.with_params('a', 'b')
                      .and_raise_error(Puppet::ParseError, %r{wrong number of arguments})
  end

  [true, false, {}, 'foo', nil].each do |input|
    it 'fails when not called with an array' do
      is_expected.to run.with_params(input)
                        .and_raise_error(Puppet::ParseError, %r{is not an Array})
    end
  end

  it 'fails when passed an empty array' do
    is_expected.to run.with_params([])
                      .and_raise_error(Puppet::ParseError, %r{Array may not be empty})
  end

  it 'fails when passed an array of anything but hashes' do
    clusters = ['foo', 'bar']
    is_expected.to run.with_params(clusters)
                      .and_raise_error(Puppet::ParseError, %r{is not a Hash})
  end

  it 'fails when passed an array of empty hashes' do
    clusters = [{}, {}]
    is_expected.to run.with_params(clusters)
                      .and_raise_error(Puppet::ParseError, %r{Hash may not be empty})
  end

  it 'fails when name key is missing' do
    clusters = [{ 'address' => 'localhost' }]
    is_expected.to run.with_params(clusters)
                      .and_raise_error(Puppet::ParseError, %r{must contain a name key})
  end

  it 'fails when name key is not a string and address is present' do
    clusters = [{ 'name' => ['my cluster'], 'address' => 'localhost' }]
    is_expected.to run.with_params(clusters)
                      .and_raise_error(Puppet::ParseError, %r{name key must be a String})
  end

  it 'fails when address key is missing' do
    clusters = [{ 'name' => 'my cluster' }]
    is_expected.to run.with_params(clusters)
                      .and_raise_error(Puppet::ParseError, %r{must contain an address key})
  end

  it 'fails when address key is not a string|array' do
    clusters = [{ 'name' => 'my cluster', 'address' => { 'a' => 1 } }]
    is_expected.to run.with_params(clusters)
                      .and_raise_error(Puppet::ParseError, %r{address key must be a String or Array})
  end

  it 'work with optional polling_interval string key' do
    clusters = [{ 'name' => 'my cluster', 'address' => 'localhost', 'polling_interval' => '10' }]
    is_expected.to run.with_params(clusters).and_return(clusters)
  end

  it 'work with optional polling_interval integer key' do
    clusters = [{ 'name' => 'my cluster', 'address' => 'localhost', 'polling_interval' => 10 }]
    is_expected.to run.with_params(clusters).and_return(clusters)
  end

  it 'fails when polling_interval key is not a String' do
    clusters = [{ 'name' => 'my cluster', 'address' => 'localhost', 'polling_interval' => [10] }]
    is_expected.to run.with_params(clusters)
                      .and_raise_error(Puppet::ParseError, %r{polling_interval key must be a String or Integer})
  end

  it 'fails with unknown keys' do
    clusters = [{ 'name' => 'my cluster', 'address' => 'localhost', 'polling_interval' => 10, 'foo' => 1, 'bar' => 2 }]
    is_expected.to run.with_params(clusters)
                      .and_raise_error(Puppet::ParseError, %r{contains unknown keys \(bar foo\)})
  end

  it 'work with reasonable input - simple example' do
    clusters = [{ 'name' => 'my cluster', 'address' => 'localhost' }]
    is_expected.to run.with_params(clusters).and_return(clusters)
  end

  it 'work with reasonable input - complex example' do
    clusters = [
      {
        'name'    => 'foo',
        'address' => [
          'foo1.example.org',
          'foo2.example.org',
          'foo3.example.org',
        ],
      },
      {
        'name'             => 'bar',
        'address'          => [
          'bar1.example.org',
          'bar2.example.org',
          'bar3.example.org',
        ],
        'polling_interval' => 42,
      },
      {
        'name'    => 'baz',
        'address' => [
          'baz1.example.org',
          'baz2.example.org',
          'baz3.example.org',
        ],
      },
    ]
    is_expected.to run.with_params(clusters).and_return(clusters)
  end
end
