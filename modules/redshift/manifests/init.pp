class redshift {

  package { 'redshift':
    ensure => 'installed',
  }

  file { '/home/kai/.config/redshift': 
    require => [User['kai'], Package['redshift']],
    ensure  => 'directory',
    owner   => 'kai',
  }~>
  file { 'redshiftconfig':
    require => [User['kai'], Package['redshift']],
    source  => 'puppet:///modules/redshift/redshift.conf',
    path    => '/home/kai/.config/redshift/redshift.conf',
    ensure  => 'present',
    owner   => 'kai',
  }

}
