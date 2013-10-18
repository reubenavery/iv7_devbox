#
# Main Puppet manifest for ivillage-drupal7 vagrant dev box
#

# We don't want no stinkin' iptables on our locals.
service { ["iptables", "ip6tables"] :
  ensure => stopped,
  enable => false,
  hasstatus => true,
}

class { 'yum': }
class { 'motd': }
class { 'bashrc': }
class { 'apache': }

class { 'mysql::server':
  config_hash => {
    'datadir' => '/var/lib/mysql',
    'pidfile' => '/var/run/mysqld/mysqld.pid',
    'socket' => '/tmp/mysql.sock',
    'manage_config_file' => 1,
    'config_file' => '/etc/my.cnf', 
    'root_password' => 'ChangeThisNow!',
    'innodb_file_per_table' => 1,
    'max_allowed_packet' => '32M'
  }
}

class { 'couchbase': }
class { 'php53': }
class { 'pear': }
class { 'pecl': }
class { 'drush': }

 Open up httpd log directory access for easy viewing.
file { "/var/log/httpd" :
  mode => "0755",
  require => Class["apache"],
}
