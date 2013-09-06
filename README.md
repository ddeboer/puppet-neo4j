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
       edition     = 'community',
       version     = '2.0.0-M04',
       install_dir = '/opt/neo4j',
    }

License
-------

puppet-composer is released under the MIT License. See the bundled LICENSE file
for details.
