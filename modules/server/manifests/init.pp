class server {

# Asennetaan openssh -server
package { 'openssh-server':
	ensure => present,
	allowcdrom => true,
}

file {'/etc/ssh/sshd_config':
	ensure => "file",
	require => Package['openssh-server'],
}

service { 'ssh':
		ensure => running,
		enable => true,
		subscribe => Package['openssh-server'],
		require => File['/etc/ssh/sshd_config'],
}

# Asennetaan Apache2
package { 'apache2':
	ensure => 'installed',
	enable => 'true',
	allowcdrom => 'true',
}

service { 'apache2':
	ensure => 'true',
	enable => 'true',
	require => Package['apache2'],
}

}

