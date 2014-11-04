require 'spec_helper'

describe 'ganglia_validate_rras', :type => :puppet_function do
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
    rras = ['foo', 'bar']
    expect { subject.call([rras]) }.
      to raise_error(Puppet::ParseError, /is not a Hash/)
  end

  it 'should fail when passed an array of empty hashes' do
    rras = [{}, {}]
    expect { subject.call([rras]) }.
      to raise_error(Puppet::ParseError, /Hash may not be empty/)
  end

  it 'should fail when cf key is missing ' do
    rras = [{ 'xff' => 0.5, 'steps' => 1, 'rows' => 5856 }]
    expect { subject.call([rras]) }.
      to raise_error(Puppet::ParseError, /must contain a cf key/)
  end

  it 'should fail when cf key is not a string' do
    rras = [{ 'cf' => ['my cluster'], 'xff' => 0.5, 'steps' => 1, 'rows' => 5856 }]
    expect { subject.call([rras]) }.
      to raise_error(Puppet::ParseError, /name cf must be a String/)
  end
  
  it 'should fail when xff key is missing ' do
    rras = [{ 'cf' => 'AVERAGE', 'steps' => 1, 'rows' => 5856 }]
    expect { subject.call([rras]) }.
      to raise_error(Puppet::ParseError, /must contain a xff key/)
  end

  it 'should fail when steps key is missing ' do
    rras = [{ 'cf' => 'AVERAGE', 'xff' => 0.5, 'rows' => 5856 }]
    expect { subject.call([rras]) }.
      to raise_error(Puppet::ParseError, /must contain a steps key/)
  end
  
  it 'should fail when rows key is missing ' do
    rras = [{ 'cf' => 'AVERAGE', 'xff' => 0.5, 'steps' => 1 }]
    expect { subject.call([rras]) }.
      to raise_error(Puppet::ParseError, /must contain a rows key/)
  end

  it 'should fail with unknown keys' do
    rras = [{ 'cf' => 'AVERAGE', 'xff' => 0.5, 'steps' => 1, 'rows' => 5856, 'foo' => 1, 'bar' => 2 }]
    expect { subject.call([rras]) }.
      to raise_error(Puppet::ParseError, /contains unknown keys \(bar foo\)/)
  end

  it 'work with reasonable input - simple example' do
    rras = [{ 'cf' => 'AVERAGE', 'xff' => 0.5, 'steps' => 1, 'rows' => 5856 }]
    subject.call([rras])
  end
end
