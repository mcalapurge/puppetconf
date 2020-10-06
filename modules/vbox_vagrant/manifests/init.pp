class vbox_vagrant {

  #install vagrant
  #require => User['kai']
  
  package { 'virtualbox':
    ensure => 'installed',
  }

  package { 'vagrant':
    ensure => 'installed',
  }~>
  exec { 'vagrant-hostmanager':
    require => Package[vagrant], 
    command => '/usr/bin/vagrant plugin install vagrant-hostmanager'
  }
  #pace vagrant config
  file {'/home/kai/.vagrant.d':
    ensure  => 'directory',
    owner   => 'kai',
  }

  file { 'vagrantfile':
    require => [File['/home/kai/.vagrant.d'], User['kai']],
    source  => 'puppet:///modules/vbox_vagrant/Vagrantfile',
    path    => '/home/kai/.vagrant.d/Vagrantfile',
    ensure  => 'present',
    owner   => 'kai',
  }

}
