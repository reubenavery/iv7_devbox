class apache::services {
  service { "httpd":
    name => "httpd",
    ensure => running,
    enable => true,
    require => Package["httpd"],
  }
}
