class neo4j(
  $edition     = 'community',
  $version     = '2.0.0-M04',
  $install_dir = '/opt/neo4j',
) {
  $dirname  = "neo4j-${edition}-${version}"
  $filename = "${dirname}-unix.tar.gz"

  class { 'neo4j::download':
    edition     => $edition,
    version     => $version,
    filename    => $filename,
  } ->

  class { 'neo4j::install':
    binary      => "/tmp/${filename}",
    install_dir => $install_dir,
    dirname     => $dirname,
  } ->

  class { 'neo4j::configure':
    install_dir => "${install_dir}/${dirname}"
  } ->

  service { 'neo4j-service':
    ensure => running,
  }
}