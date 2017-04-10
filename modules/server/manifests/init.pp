class server {

# Asennetaan openssh -server
package { 'openssh-server':
	ensure => present,
	allowcdrom => true,
}

file {'/etc/ssh/sshd_config':
	ensure => file,
	require => Package{'openssh-server'],
}

service { 'ssh':
		ensure => $running,
		enable => $enable,
		hasstatus => true,
		subscribe => [Package['openssh-server'],
		require => File['/etc/ssh/sshd_config'],
	}
}

# Asennetaan Apache
package { 'apache2':
	ensure => installed,
	allowcdrom => true,
	}

service { "apache2":
	enable => true,
	ensure => started,
	hasrestart => true,
	hasstatus => true,
	require => Package["apache2"]
	}
}

