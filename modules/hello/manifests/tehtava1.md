#Tehtävä 1
Puppetin asentaminen ja sellaisen skriptin kirjoittaminen, joka käyttää vähintään kahta eri resurssia.

##Vaihe 1: Puppetin asentaminen.
Asensin puppetin Linux Mintiin komennolla sudo apt install puppet

##Vaihe 2: Hakemistorakenteen luonti.
Loin tarvittavat hakemistot komennolla
mkdir puppet/modules/hello/manifests

##Vaihe 3:
modulin init.pp kirjoittaminen
Kirjoitin manifests-hakemistoon modulin init.pp käyttäen tekstieditori nanoa.
cd ~/puppet/modules/hello/manifests
nano init.pp

init.pp näyttää tältä:
class hello {
	file { '/tmp/hello'':
	content => "Hello World!\n"
	}
	package { 'lynx':
		ensure => installed,
		name   => $lynx,
	}

Skripti luo aluksi tiedoston hello hakemistoon /tmp.
Sen jälkeen se varmistaa, että tekstipohjainen verkkoselain lynx on asennettuna.

##Vaihe 4: Moduulin ajaminen
Ennen kuin ajoin skriptin, varmistin, ettei helloa tai lynxiä ollut jo asennettu
rm /tmp/hello
sudo apt remove lynx

Suoritin moduulin komennolla
sudo puppet apply --modulepath ~/puppet/modules/ -e class {"hello":}'
sudo tarvittiin lynxin asentamisen takia.

##Vaihe 5: Suorituksen toteaminen
Lopuksi tarkistin, että moduuli teki, mitä piti:
cat /tmp/hello tulosti Hello, World!
lynx käynnistyi komennolla lynx.
