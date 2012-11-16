class ganglia::gmetad(
  $clusters = [ { 'name' => 'my cluster', 'address' => 'localhost' } ],
  $gridname = '',
) inherits ganglia::params {
  validate_array($clusters)
  validate_string($gridname)

  class{ 'ganglia::gmetad::config': } ->
  class{ 'ganglia::gmetad::install': } ->
  class{ 'ganglia::gmetad::service': } ->
  Class[ 'ganglia::gmetad' ]
}
