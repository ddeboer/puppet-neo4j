class neo4j::configure(
  $install_dir
) {

  # Make sure Neo4j is accessible from outside the VM
  exec { 'configure network':
    onlyif	=> "grep '#org.neo4j.server.webserver.address=0.0.0.0' ${install_dir}/conf/neo4j-server.properties",
    command	=> "sed -i -e s/'#org.neo4j.server.webserver.address=0.0.0.0'/'org.neo4j.server.webserver.address=0.0.0.0'/g ${install_dir}/conf/neo4j-server.properties",
    path    => '/bin',
    notify  => Service['neo4j-service'],
  }
}