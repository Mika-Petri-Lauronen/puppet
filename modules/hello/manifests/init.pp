class hello {
        file { '/tmp/hello'':
        content => "Hello World!\n"
        }
        package { 'lynx':
                ensure => installed,
                name   => $lynx,
        }
