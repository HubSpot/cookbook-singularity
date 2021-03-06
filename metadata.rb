name             'singularity'
maintainer       'Tom Petr'
maintainer_email 'tpetr@hubspot.com'
license          'All rights reserved'
description      'Installs Singularity dependencies (mesos, zk, mysql)'
version          '0.5.0'
supports         'ubuntu'

depends 'apt'
depends 'mysql', '5.6.1'
depends 'database'
depends 'hostsfile'
depends 'java'
