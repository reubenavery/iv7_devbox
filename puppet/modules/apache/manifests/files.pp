class apache::files {
  file { "/etc/httpd/conf.d/vhosts.conf":
    ensure => file,
    content => template("${module_name}/vhosts.conf.erb"),
    notify => Service["httpd"],
    require => [ Package["httpd"], File["/opt/ivillage"] ],
    owner => 'root',
    group => 'root',
    mode => '0644'
  }
  
  file { "/etc/httpd/conf.d/apache-tuning.conf":
    ensure => present,
    source => "puppet:///modules/apache/$environment/apache-tuning.conf",
    notify => Service["httpd"],
    require => Package["httpd"],
    owner => 'root',
    group => 'root',
    mode => '0644'
  }
  
  file { "/opt/ivillage":
    ensure => directory,
    owner => 'www',
    seluser => 'system_u',
    seltype => 'httpd_sys_content_t',
    notify => Service["httpd"],
  }
  
#  exec { "make-webdir-readable":
#    command => "/bin/chmod -R o+rwX /opt/ivillage",
#    onlyif => "/usr/bin/test"
#  }
  
  file { "/etc/httpd/conf/httpd.conf": 
    ensure => file,
    source => "puppet:///modules/apache/$environment/httpd.conf",
    owner => 'root',
    group => 'root',
    mode => '0644'
  }
}
