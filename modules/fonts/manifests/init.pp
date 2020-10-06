class fonts {

  file { '/usr/share/fonts':
    ensure => 'directory',
  }~>
  file { 'fontawesome':
    source => 'puppet:///modules/fonts/fontawesome-webfont.ttf',
    path   => '/usr/share/fonts/fontawesome-webfont.ttf',
    ensure => 'present',
  }~>
  file { 'FiraMono-Regular.otf':
    source => 'puppet:///modules/fonts/FiraMono-Regular.otf',
    path   => '/usr/share/fonts/FiraMono-Regular.otf',
    ensure => 'present',
  }

}
