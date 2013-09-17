class neo4j::install(
  $binary,
  $install_dir,
  $dirname,
) {
  file { "${install_dir}":
    ensure => directory,
  }

  exec { 'extract archive':
    command => "tar -xzvf ${binary}",
    cwd     => $install_dir,
    path    => '/bin',
    creates => "${install_dir}/${dirname}",
  }

  exec { 'neo4j install':
    command => "${install_dir}/${dirname}/bin/neo4j install -u neo4j -h",
    creates => '/etc/init.d/neo4j-service',
  }

  $java_package = $::osfamily ? {
    'Debian'  => 'openjdk-7-jre',
    default   => 'java-1.7.0-openjdk'
  }

  if !defined(Package[$java_package]) {
    package { $java_package:
      ensure => installed,
    }
  }

  if !defined(Package['lsof']) {
    package { 'lsof':
      ensure => installed,
    }
  }
}