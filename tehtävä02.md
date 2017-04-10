Tehtävän aiheena oli palvelimen asennus. Päätin, että palvelimessa on ssh ja Apache2.
Aluksi poistin vanhan asennuksen:

sudo apt purge apache2


Sitten lisäsin työhakemistoon ~/puppet/modules hakemiston server ja siihen hakemiston manifests.
Hakemistoon lisäsin tiedoston init.pp komennolla touch init.pp.

.
├── LICENSE
└── modules
    ├── hello
    │   └── manifests
    │       ├── init.pp
    │       └── tehtava1.md
    └── server
        └── manifests
            └── init.pp

init.pp -hakemiston sisältö oli seuraava:

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

