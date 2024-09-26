# frozen_string_literal: true

module Puppet::Parser::Functions
  newfunction(:ganglia_validate_rras, type: :rvalue, doc: <<-ENDHEREDOC) do |args|
    The following values will pass:

    * [{ cf => 'AVERAGE', xff => 0.5, steps => 1, rows => 5856 }]
    * [
        {
          cf => 'AVERAGE',
          xff => 0.5,
          steps => 1,
          rows => 5856
         },
         {
          cf => 'MAX',
          xff => 0.5,
          steps => 1,
          rows => 5856
         },
      ]

    * cf (consolidation function) must be AVERAGE | MIN | MAX | LAST
    * xff (xfiles factor) must be a float between 0 and 1
    * steps must be an integer
    * rows must be an integer greater than zero

    If all hashes are not defined then compilation will fail

  ENDHEREDOC

    # we accept only one arg
    raise Puppet::ParseError, "ganglia_validate_rras(): wrong number of arguments (#{args.length}; must be 1)" unless args.length == 1

    # which must be an array
    function_validate_array(args)

    # that is not empty
    rras = args[0]
    raise Puppet::ParseError, 'ganglia_validate_rras(): passed Array may not be empty' if rras.empty?

    # which must contain only Hashes
    rras.each do |r|
      function_validate_hash([r])

      # that are not empty
      raise Puppet::ParseError, 'ganglia_validate_rras(): nested Hash may not be empty' if r.empty?

      # and must contain the cf key
      raise Puppet::ParseError, 'ganglia_validate_rras(): nested Hash must contain a cf key' unless r.key?('cf')
      # which is a string
      raise Puppet::ParseError, 'ganglia_validate_rras(): nested Hash cf key must be a String of AVERAGE | MIN | MAX | LAST' unless r['cf'].is_a?(String)
      # and must be either AVERAGE, MIN, MAX or LAST
      raise Puppet::ParseError, 'ganglia_validate_rras(): nested Hash cf key must be a String of AVERAGE | MIN | MAX | LAST' unless r['cf'] == 'AVERAGE' || r['cf'] == 'MIN' || r['cf'] == 'MAX' || r['cf'] == 'LAST'

      # validate values

      # and must contain the xff key
      raise Puppet::ParseError, 'ganglia_validate_rras(): nested Hash must contain an xff key' unless r.key?('xff')

      r['xff'] = Float(r['xff'])
      # must be between 0 and 1
      raise Puppet::ParseError, 'ganglia_validate_rras(): nested Hash xff key must be a Float or Integer between 0 and 1' unless (r['xff'] >= 0.0) && (r['xff'] <= 1.0)

      # and must contain the steps key
      raise Puppet::ParseError, 'ganglia_validate_rras(): nested Hash must contain a steps key' unless r.key?('steps')

      # convert steps to integer for checking
      r['steps'] = begin
        Integer(r['steps'])
      rescue StandardError
        nil
      end

      # steps must be an integer
      raise Puppet::ParseError, 'ganglia_validate_rras(): nested Hash steps key must be an Integer greater than 0' unless r['steps'].is_a?(Integer)

      # and greater than zero
      raise Puppet::ParseError, 'ganglia_validate_rras(): nested Hash steps key must be an Integer greater than 0' unless (r['steps']).positive?

      # and must contain the rows key
      raise Puppet::ParseError, 'ganglia_validate_rras(): nested Hash must contain a rows key' unless r.key?('rows')

      # convert rows to integer for checking
      r['rows'] = begin
        Integer(r['rows'])
      rescue StandardError
        nil
      end

      # rows must be an integer
      raise Puppet::ParseError, 'ganglia_validate_rras(): nested Hash rows key must be an Integer greater than 0' unless r['rows'].is_a?(Integer)

      # and greater than zero
      raise Puppet::ParseError, 'ganglia_validate_rras(): nested Hash rows key must be an Integer greater than 0' unless (r['rows']).positive?

      # any other keys should be rejected
      extras = r.keys - %w[cf xff steps rows]
      raise Puppet::ParseError, "ganglia_validate_rras(): nested Hash contains unknown keys (#{extras.sort.join(' ')})" unless extras.empty?
    end
  end
end
