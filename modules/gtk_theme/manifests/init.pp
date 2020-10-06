class gtk_theme {

  file { '/home/kai/.themes':
    require => User['kai'],  
    ensure  => 'directory',
    owner   => 'kai'
  }~>
  file { 'nekaiko-themeGTK':
    source  => 'puppet:///modules/gtk_theme/nekaiko-themeGTK',
    path    => '/home/kai/.themes/nekaiko-themeGTK',
    ensure  => 'directory',
    owner   => 'kai',
    recurse => true,
  }~>
  file { '/home/kai/.icons':
    require => User['kai'],  
    ensure  => 'directory',
    owner   => 'kai'
  }~>
  file { 'plane.icons':
    source  => 'puppet:///modules/gtk_theme/plane',
    path    => '/home/kai/.icons/plane',
    ensure  => 'directory',
    owner   => 'kai',
    recurse => true,
  }~>
  file { '/home/kai/.config/gtk-3.0':
    require => [File['/home/kai/.config'], User['kai']],
    ensure  => 'directory',
    }~>
  file { 'settings-gtk.ini':
    ensure  => 'present',
    source  => 'puppet:///modules/gtk_theme/settings.ini',
    path    => '/home/kai/.config/gtk-3.0/settings.ini',
  }~>
  file { 'gtk2rc':
    ensure  => 'present',
    source  => 'puppet:///modules/gtk_theme/gtkrc-2.0',
    path    => '/home/kai/.gtkrc-2.0',
  }
}
