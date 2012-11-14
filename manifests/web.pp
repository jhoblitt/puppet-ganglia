class ganglia::web(
  $ganglia_ip = '127.0.0.1',
  $ganglia_port = 8652,
) inherits ganglia::params {

  class{ 'ganglia::web::install': } ->
  class{ 'ganglia::web::config': } ->
  Class[ 'ganglia::web' ]
}
