name             'singularity'
maintainer       'Elias Torres'
maintainer_email 'elias@torrez.us'
license          'All rights reserved'
description      'Installs/Configures Singularity'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'
supports         'ubuntu'
recipe           "singularity::db_setup", "initial MySQL setup for Singularity"

depends "mysql_database"

attribute           "singularity/db_name",
  :recipes       => ["singularity::db_setup"],
  :display_name  => "database name",
  :description   => "meh",
  :default       => "singularity"


