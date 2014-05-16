require 'spec_helper'

describe 'ganglia_validate_clusters', :type => :puppet_function do
  it 'should fail with no params' do
    expect { subject.call([]) }.
      to raise_error(Puppet::ParseError)
  end

  it 'should fail with > 1 param' do
    expect { subject.call(['a', 'b']) }.
      to raise_error(Puppet::ParseError, /wrong number of arguments/)
  end

  [ true, false, {}, "foo", nil ].each do |input|
    it 'should fail when not called with an array' do
      expect { subject.call([input]) }.
        to raise_error(Puppet::ParseError, /is not an Array/)
    end
  end

  it 'should fail when passed an empty array' do
    expect { subject.call([[]]) }.
      to raise_error(Puppet::ParseError, /Array may not be empty/)
  end

  it 'should fail when passed an array of anything but hashes' do
    clusters = ['foo', 'bar']
    expect { subject.call([clusters]) }.
      to raise_error(Puppet::ParseError, /is not a Hash/)
  end

  it 'should fail when passed an array of empty hashes' do
    clusters = [{}, {}]
    expect { subject.call([clusters]) }.
      to raise_error(Puppet::ParseError, /Hash may not be empty/)
  end

  it 'should fail when name key is missing ' do
    clusters = [{ 'address' => 'localhost' }]
    expect { subject.call([clusters]) }.
      to raise_error(Puppet::ParseError, /must contain a name key/)
  end

  it 'should fail when name key is not a string' do
    clusters = [{ 'name' => ['my cluster'], 'address' => 'localhost' }]
    expect { subject.call([clusters]) }.
      to raise_error(Puppet::ParseError, /name key must be a String/)
  end

  it 'should fail when address key is missing' do
    clusters = [{ 'name' => 'my cluster' }]
    expect { subject.call([clusters]) }.
      to raise_error(Puppet::ParseError, /must contain an address key/)
  end

  it 'should fail when address key is not a string|array' do
    clusters = [{ 'name' => 'my cluster', 'address' => {'a' => 1} }]
    expect { subject.call([clusters]) }.
      to raise_error(Puppet::ParseError, /address key must be a String or Array/)
  end

  it 'work with optional polling_interval key' do
    clusters = [{ 'name' => 'my cluster', 'address' => 'localhost', 'polling_interval' => '10' }]
    subject.call([clusters])
  end

  it 'work with optional polling_interval key' do
    clusters = [{ 'name' => 'my cluster', 'address' => 'localhost', 'polling_interval' => 10 }]
    subject.call([clusters])
  end

  it 'should fail when polling_interval key is not a String' do
    clusters = [{ 'name' => 'my cluster', 'address' => 'localhost', 'polling_interval' => [ 10 ] }]
    expect { subject.call([clusters]) }.
      to raise_error(Puppet::ParseError, /polling_interval key must be a String or Integer/)
  end

  it 'should fail with unknown keys' do
    clusters = [{ 'name' => 'my cluster', 'address' => 'localhost', 'polling_interval' => 10, 'foo' => 1, 'bar' => 2 }]
    expect { subject.call([clusters]) }.
      to raise_error(Puppet::ParseError, /contains unknown keys \(bar foo\)/)
  end

  it 'work with reasonable input - simple example' do
    clusters = [{ 'name' => 'my cluster', 'address' => 'localhost' }]
    subject.call([clusters])
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
          'bar3.example.org'
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
    subject.call([clusters])
  end
end

