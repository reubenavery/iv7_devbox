class yum {
    file { "/etc/yum.conf":
        source => "puppet:///modules/yum/yum.conf",
        owner => root,
        group => root,
        mode => '0644',
    }
}
