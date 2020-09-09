require 'spec_helper'

describe 'ganglia_validate_rras', type: :puppet_function do
  it 'fails with no params' do
    is_expected.to run.with_params
                      .and_raise_error(Puppet::ParseError, %r{wrong number of arguments})
  end

  it 'fails with > 1 param' do
    is_expected.to run.with_params('a', 'b')
                      .and_raise_error(Puppet::ParseError, %r{wrong number of arguments})
  end

  it 'fails when passed an empty array' do
    is_expected.to run.with_params([])
                      .and_raise_error(Puppet::ParseError, %r{Array may not be empty})
  end

  it 'fails when passed an array of wrong values' do
    rras = ['foo', 'bar']
    is_expected.to run.with_params(rras)
                      .and_raise_error(Puppet::ParseError, %r{is not a Hash})
  end

  it 'fails when passed an array of empty hashes' do
    rras = [{}, {}]
    is_expected.to run.with_params(rras)
                      .and_raise_error(Puppet::ParseError, %r{Hash may not be empty})
  end

  it 'fails when cf key is missing' do
    rras = [{ 'xff' => 0.5, 'steps' => 1, 'rows' => 5856 }]
    is_expected.to run.with_params(rras)
                      .and_raise_error(Puppet::ParseError, %r{must contain a cf key})
  end

  it 'fails when cf key is not a string' do
    rras = [{ 'cf' => ['my cluster'], 'xff' => 0.5, 'steps' => 1, 'rows' => 5856 }]
    is_expected.to run.with_params(rras)
                      .and_raise_error(Puppet::ParseError, %r{cf key must be a String})
  end

  it 'fails when cf key is not one of the four options' do
    rras = [{ 'cf' => 'foo', 'xff' => 0.5, 'steps' => 1, 'rows' => 5856 }]
    is_expected.to run.with_params(rras)
                      .and_raise_error(Puppet::ParseError, %r{cf key must be a String})
  end

  it 'fails when xff key is missing' do
    rras = [{ 'cf' => 'AVERAGE', 'steps' => 1, 'rows' => 5856 }]
    is_expected.to run.with_params(rras)
                      .and_raise_error(Puppet::ParseError, %r{must contain an xff key})
  end

  it 'fails when xff key is > 1' do
    rras = [{ 'cf' => 'AVERAGE', 'xff' => 1.1, 'steps' => 1, 'rows' => 5856 }]
    is_expected.to run.with_params(rras)
                      .and_raise_error(Puppet::ParseError, %r{xff key must be a Float or Integer between 0 and 1})
  end

  it 'fails when xff key is < 0' do
    rras = [{ 'cf' => 'AVERAGE', 'xff' => -0.1, 'steps' => 1, 'rows' => 5856 }]
    is_expected.to run.with_params(rras)
                      .and_raise_error(Puppet::ParseError, %r{xff key must be a Float or Integer between 0 and 1})
  end

  it 'fails when steps key is missing' do
    rras = [{ 'cf' => 'AVERAGE', 'xff' => 0.5, 'rows' => 5856 }]
    is_expected.to run.with_params(rras)
                      .and_raise_error(Puppet::ParseError, %r{must contain a steps key})
  end

  it 'fails when steps key is not integer' do
    rras = [{ 'cf' => 'AVERAGE', 'xff' => 0.5, 'steps' => 'foo', 'rows' => 5856 }]
    is_expected.to run.with_params(rras)
                      .and_raise_error(Puppet::ParseError, %r{steps key must be an Integer greater than 0})
  end

  it 'fails when steps key is < 0' do
    rras = [{ 'cf' => 'AVERAGE', 'xff' => 0.5, 'steps' => -1, 'rows' => 5856 }]
    is_expected.to run.with_params(rras)
                      .and_raise_error(Puppet::ParseError, %r{steps key must be an Integer greater than 0})
  end

  it 'fails when rows key is missing' do
    rras = [{ 'cf' => 'AVERAGE', 'xff' => 0.5, 'steps' => 1 }]
    is_expected.to run.with_params(rras)
                      .and_raise_error(Puppet::ParseError, %r{must contain a rows key})
  end

  it 'fails when rows key is not integer' do
    rras = [{ 'cf' => 'AVERAGE', 'xff' => 0.5, 'steps' => 1, 'rows' => 'foo' }]
    is_expected.to run.with_params(rras)
                      .and_raise_error(Puppet::ParseError, %r{rows key must be an Integer greater than 0})
  end

  it 'fails when rows key is < 0' do
    rras = [{ 'cf' => 'AVERAGE', 'xff' => 0.5, 'steps' => 1, 'rows' => -1 }]
    is_expected.to run.with_params(rras)
                      .and_raise_error(Puppet::ParseError, %r{rows key must be an Integer greater than 0})
  end

  it 'fails with unknown keys' do
    rras = [{ 'cf' => 'AVERAGE', 'xff' => 0.5, 'steps' => 1, 'rows' => 5856, 'foo' => 1, 'bar' => 2 }]
    is_expected.to run.with_params(rras)
                      .and_raise_error(Puppet::ParseError, %r{contains unknown keys \(bar foo\)})
  end

  it 'work with reasonable input - simple example' do
    rras = [{ 'cf' => 'AVERAGE', 'xff' => 0.5, 'steps' => 1, 'rows' => 5856 }]
    is_expected.to run.with_params(rras).and_return(rras)
  end
end
