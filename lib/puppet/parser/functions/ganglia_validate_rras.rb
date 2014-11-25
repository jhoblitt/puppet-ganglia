module Puppet::Parser::Functions

  newfunction(:ganglia_validate_rras, :doc => <<-'ENDHEREDOC') do |args|
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

    Puppet::Parser::Functions.autoloader.loadall

    # we accept only one arg
    unless args.length == 1 then
      raise Puppet::ParseError, ("ganglia_validate_rras(): wrong number of arguments (#{args.length}; must be 1)")
    end

    # which must be an array
    function_validate_array(args)

    # that is not empty
    rras = args[0]
    unless rras.length > 0
      raise Puppet::ParseError, ("ganglia_validate_rras(): passed Array may not be empty")
    end

    # which must contain only Hashes
    rras.each do |r|
      function_validate_hash([r])

      # that are not empty
      unless r.length > 0
        raise Puppet::ParseError, ("ganglia_validate_rras(): nested Hash may not be empty")
      end

      # and must contain the cf key
      unless r.has_key?('cf')
        raise Puppet::ParseError, ("ganglia_validate_rras(): nested Hash must contain a cf key")
      end
      # which is a string
      unless r['cf'].is_a?(String) 
        raise Puppet::ParseError, ("ganglia_validate_rras(): nested Hash cf key must be a String of AVERAGE | MIN | MAX | LAST")
      end
      # and must be either AVERAGE, MIN, MAX or LAST
      unless r['cf'] == 'AVERAGE' || r['cf'] == 'MIN' || r['cf'] == 'MAX' || r['cf'] == 'LAST'
        raise Puppet::ParseError, ("ganglia_validate_rras(): nested Hash cf key must be a String of AVERAGE | MIN | MAX | LAST")
      end
      
      # validate values

      # and must contain the xff key
      unless r.has_key?('xff')
        raise Puppet::ParseError, ("ganglia_validate_rras(): nested Hash must contain an xff key")
      end
      r['xff'] = Float(r['xff'])
      # must be between 0 and 1
      unless (r['xff'] >= 0.0) && (r['xff'] <= 1.0)
        raise Puppet::ParseError, ("ganglia_validate_rras(): nested Hash xff key must be a Float or Integer between 0 and 1")
      end

      # and must contain the steps key
      unless r.has_key?('steps')
        raise Puppet::ParseError, ("ganglia_validate_rras(): nested Hash must contain a steps key")
      end
      
      # convert steps to integer for checking
      r['steps'] = Integer(r['steps']) rescue nil
      
      # steps must be an integer
      unless r['steps'].is_a?(Integer)
        raise Puppet::ParseError, ("ganglia_validate_rras(): nested Hash steps key must be an Integer greater than 0")
      end
      
      # and greater than zero
      unless r['steps'] > 0
        raise Puppet::ParseError, ("ganglia_validate_rras(): nested Hash steps key must be an Integer greater than 0")
      end
      
      # and must contain the rows key
      unless r.has_key?('rows')
        raise Puppet::ParseError, ("ganglia_validate_rras(): nested Hash must contain a rows key")
      end
      
      # convert rows to integer for checking
      r['rows'] = Integer(r['rows']) rescue nil
      
      # rows must be an integer
      unless r['rows'].is_a?(Integer)
        raise Puppet::ParseError, ("ganglia_validate_rras(): nested Hash rows key must be an Integer greater than 0")
      end
      
      # and greater than zero
      unless r['rows'] > 0
        raise Puppet::ParseError, ("ganglia_validate_rras(): nested Hash rows key must be an Integer greater than 0")
      end

      # any other keys should be rejected
      extras = r.keys - %w{ cf xff steps rows }
      if extras.length > 0
        raise Puppet::ParseError, ("ganglia_validate_rras(): nested Hash contains unknown keys (#{extras.sort.join(' ')})") 
      end
    end
  end

end
