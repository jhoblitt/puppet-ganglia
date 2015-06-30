require 'spec_helper'

describe 'ganglia_validate_rras', :type => :puppet_function do
  it 'should fail with no params' do
    should run.with_params().
      and_raise_error(Puppet::ParseError, /wrong number of arguments/)
  end

  it 'should fail with > 1 param' do
    should run.with_params('a', 'b').
      and_raise_error(Puppet::ParseError, /wrong number of arguments/)
  end

  [ true, false, {}, "foo", nil ].each do |input|
    it 'should fail when not called with an array' do
      should run.with_params(input).
        and_raise_error(Puppet::ParseError, /is not an Array/)
    end
  end

  it 'should fail when passed an empty array' do
    should run.with_params([]).
      and_raise_error(Puppet::ParseError, /Array may not be empty/)
  end

  it 'should fail when passed an array of anything but hashes' do
    rras = ['foo', 'bar']
    should run.with_params(rras).
      and_raise_error(Puppet::ParseError, /is not a Hash/)
  end

  it 'should fail when passed an array of empty hashes' do
    rras = [{}, {}]
    should run.with_params(rras).
      and_raise_error(Puppet::ParseError, /Hash may not be empty/)
  end

  it 'should fail when cf key is missing ' do
    rras = [{ 'xff' => 0.5, 'steps' => 1, 'rows' => 5856 }]
    should run.with_params(rras).
      and_raise_error(Puppet::ParseError, /must contain a cf key/)
  end

  it 'should fail when cf key is not a string' do
    rras = [{ 'cf' => ['my cluster'], 'xff' => 0.5, 'steps' => 1, 'rows' => 5856 }]
    should run.with_params(rras).
      and_raise_error(Puppet::ParseError, /cf key must be a String/)
  end

  it 'should fail when cf key is not one of the four options' do
    rras = [{ 'cf' => 'foo', 'xff' => 0.5, 'steps' => 1, 'rows' => 5856 }]
    should run.with_params(rras).
      and_raise_error(Puppet::ParseError, /cf key must be a String/)
  end

  it 'should fail when xff key is missing ' do
    rras = [{ 'cf' => 'AVERAGE', 'steps' => 1, 'rows' => 5856 }]
    should run.with_params(rras).
      and_raise_error(Puppet::ParseError, /must contain an xff key/)
  end

  it 'should fail when xff key is > 1 ' do
    rras = [{ 'cf' => 'AVERAGE', 'xff' => 1.1, 'steps' => 1, 'rows' => 5856 }]
    should run.with_params(rras).
      and_raise_error(Puppet::ParseError, /xff key must be a Float or Integer between 0 and 1/)
  end

  it 'should fail when xff key is < 0 ' do
    rras = [{ 'cf' => 'AVERAGE', 'xff' => -0.1, 'steps' => 1, 'rows' => 5856 }]
    should run.with_params(rras).
      and_raise_error(Puppet::ParseError, /xff key must be a Float or Integer between 0 and 1/)
  end

  it 'should fail when steps key is missing ' do
    rras = [{ 'cf' => 'AVERAGE', 'xff' => 0.5, 'rows' => 5856 }]
    should run.with_params(rras).
      and_raise_error(Puppet::ParseError, /must contain a steps key/)
  end

  it 'should fail when steps key is not integer ' do
    rras = [{ 'cf' => 'AVERAGE', 'xff' => 0.5, 'steps' => 'foo', 'rows' => 5856 }]
    should run.with_params(rras).
      and_raise_error(Puppet::ParseError, /steps key must be an Integer greater than 0/)
  end

  it 'should fail when steps key is < 0 ' do
    rras = [{ 'cf' => 'AVERAGE', 'xff' => 0.5, 'steps' => -1, 'rows' => 5856 }]
    should run.with_params(rras).
      and_raise_error(Puppet::ParseError, /steps key must be an Integer greater than 0/)
  end

  it 'should fail when rows key is missing ' do
    rras = [{ 'cf' => 'AVERAGE', 'xff' => 0.5, 'steps' => 1 }]
    should run.with_params(rras).
      and_raise_error(Puppet::ParseError, /must contain a rows key/)
  end

  it 'should fail when rows key is not integer ' do
    rras = [{ 'cf' => 'AVERAGE', 'xff' => 0.5, 'steps' => 1, 'rows' => 'foo' }]
    should run.with_params(rras).
      and_raise_error(Puppet::ParseError, /rows key must be an Integer greater than 0/)
  end

  it 'should fail when rows key is < 0 ' do
    rras = [{ 'cf' => 'AVERAGE', 'xff' => 0.5, 'steps' => 1, 'rows' => -1 }]
    should run.with_params(rras).
      and_raise_error(Puppet::ParseError, /rows key must be an Integer greater than 0/)
  end

  it 'should fail with unknown keys' do
    rras = [{ 'cf' => 'AVERAGE', 'xff' => 0.5, 'steps' => 1, 'rows' => 5856, 'foo' => 1, 'bar' => 2 }]
    should run.with_params(rras).
      and_raise_error(Puppet::ParseError, /contains unknown keys \(bar foo\)/)
  end

  it 'work with reasonable input - simple example' do
    rras = [{ 'cf' => 'AVERAGE', 'xff' => 0.5, 'steps' => 1, 'rows' => 5856 }]
    should run.with_params(rras).and_return(rras)
  end
end
