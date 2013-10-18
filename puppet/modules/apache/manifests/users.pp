class apache::users {
  user { "delete_apache_user":
    name => 'apache',
    ensure => absent,
    require => Package["httpd"],
    notify => Group["delete_apache_group"],
  }
  
  group { "delete_apache_group":
    name => 'apache',
    ensure => absent,
  }
  
}