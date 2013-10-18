class apache::packages {
  package { "httpd":
    name => "httpd",
    ensure => installed,
    notify => [ Exec['apache_cleanup'], File['/etc/httpd/conf/httpd.conf'] ],
  }
  
  exec { 'apache_cleanup':
    command => '/bin/rm /etc/httpd/conf.d/welcome.conf',
    onlyif => '/usr/bin/test -e /etc/httpd/conf.d/welcome.conf',
  }
}
