# frozen_string_literal: true

module Puppet::Parser::Functions
  newfunction(:ganglia_validate_clusters, type: :rvalue, doc: <<-'ENDHEREDOC') do |args|
    The following values will pass:

    * [{ 'name' => 'my cluster', 'address' => 'localhost' }]
    * [{ 'name' => 'my cluster', 'address' => 'localhost', 'polling_interval' => 10 }]
    * [
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

    The following values will fail, causing compilation to abort:

    * true
    * false
    * {}
    * 'foo'
    * undef
    * []
    * ['foo', 'bar']
    * [{}, {}]
    * [{ 'address' => 'localhost' }]
    * [{ 'name' => ['my cluster'], 'address' => 'localhost' }]
    * [{ 'name' => 'my cluster' }]
    * [{ 'name' => 'my cluster', 'address' => {'a' => 1} }]
    * [{ 'name' => 'my cluster', 'address' => 'localhost', 'polling_interval' => [ 10 ] }]
    * [{ 'name' => 'my cluster', 'address' => 'localhost', 'polling_interval' => 10, 'foo' => 1, 'bar' => 2 }]

  ENDHEREDOC

    # we accept only one arg
    raise Puppet::ParseError, "ganglia_validate_clusters(): wrong number of arguments (#{args.length}; must be 1)" unless args.length == 1

    # which must be an array
    # NOTE: This should likely be removed, as it's validated prior to getting here (param type validation)
    function_validate_array(args)

    # that is not empty
    clusters = args[0]
    raise Puppet::ParseError, 'ganglia_validate_clusters(): passed Array may not be empty' if clusters.empty?

    # which must contain only Hashes
    clusters.each do |c|
      function_validate_hash([c])

      # that are not empty
      raise Puppet::ParseError, 'ganglia_validate_clusters(): nested Hash may not be empty' if c.empty?

      # and must contain the name key
      raise Puppet::ParseError, 'ganglia_validate_clusters(): nested Hash must contain a name key' unless c.key?('name')
      # which is a string
      raise Puppet::ParseError, 'ganglia_validate_clusters(): nested Hash name key must be a String' unless c['name'].is_a?(String)

      # and must contain the address key
      raise Puppet::ParseError, 'ganglia_validate_clusters(): nested Hash must contain an address key' unless c.key?('address')
      # which is a string or an array
      raise Puppet::ParseError, 'ganglia_validate_clusters(): nested Hash address key must be a String or Array' unless c['address'].is_a?(String) || c['address'].is_a?(Array)

      # if the optional polling_interval key is set
      if c.key?('polling_interval') && !(c['polling_interval'].is_a?(String) || c['polling_interval'].is_a?(Integer))
        # it must be a string (int really)
        raise Puppet::ParseError, 'ganglia_validate_clusters(): nested Hash polling_interval key must be a String or Integer'
      end

      # any other keys should be rejected
      extras = c.keys - %w[name address polling_interval]
      raise Puppet::ParseError, "ganglia_validate_clusters(): nested Hash contains unknown keys (#{extras.sort.join(' ')})" unless extras.empty?
    end
  end
end
