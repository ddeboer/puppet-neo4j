puppet-neo4j
============

Introduction
------------

This [Puppet module](https://puppetlabs.com/) installs the [Neo4j graph database](http://www.neo4j.org/).

Installation
------------

Get the module

    git clone git://github.com/ddeboer/puppet-neo4j.git modules/neo4j

Usage
-----

To install Neo4j with defaults:

    include neo4j

Or if you want to specify some options:

    class { 'neo4j':
       edition     => 'community',
       version     => '2.0.0-M04',
       install_dir => '/opt/neo4j',
    }

Then open the Neo4j admin interface in your browser (replace `192.168.33.10` with your VM’s IP address):

    http://192.168.33.10:7474

License
-------

puppet-neo4j is released under the MIT License. See the bundled LICENSE file
for details.
