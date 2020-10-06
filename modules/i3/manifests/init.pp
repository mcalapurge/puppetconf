 class i3 {

  yumrepo { 'i3gaps_repo':
    enabled    => 1,
    descr      => 'Copr repo for i3desktop owned by gregw',
    baseurl    => 'https://copr-be.cloud.fedoraproject.org/results/gregw/i3desktop/fedora-$releasever-$basearch/',
    gpgcheck   => 0,
  }

  package { 'i3-gaps':
    require => Yumrepo['i3gaps_repo'],
    ensure  => 'installed',
  }~>
  package { 'i3status':
    ensure  => 'installed',
  }
  file { '/home/kai/.i3':
    require => User['kai'],
    ensure =>  'absent',
  }
  file { '/home/kai/.config/i3':
    ensure  => 'directory',
    owner   => 'kai',
  }~>
  file { 'i3_config':
    require   => [Package['i3-gaps'], User['kai']],
    source    => 'puppet:///modules/i3/config',
    path      => '/home/kai/.config/i3/config',
    ensure    => 'present',
  }~>

  file { 'i3status_config':
    require   => [Package['i3-gaps'], User['kai']],
    source    => 'puppet:///modules/i3/i3status.conf',
    path      => '/home/kai/.config/i3/i3status.conf',
    owner     => 'kai',
    ensure    => 'present'
  }

  package { 'feh':
    ensure  => 'installed',
  }
  
  file { '/home/kai/Pictures':
    require => User['kai'],
    ensure  => 'directory',
    owner   => 'kai',
  }~>
  file { '/home/kai/Pictures/wallpapers':
    require => User['kai'],
    ensure  => 'directory',
    owner   => 'kai',
  }

  file { 'wallpaper':
  require   => [User['kai'], File['/home/kai/Pictures/wallpapers']],
  source    => 'puppet:///modules/i3/wallpaper.jpg',
  path      => '/home/kai/Pictures/wallpapers/wallpaper.jpg',
  ensure    => 'present',
  owner     => 'kai',
  }

  package { 'rofi':
    require => Yumrepo['i3gaps_repo'],
    ensure  => 'installed',
    notify  => File['/home/kai/.config/rofi'],  
  }

  file { '/home/kai/.config/rofi':
    ensure  => 'directory',
    notify  => File['rofi_config'],
    owner   => 'kai',
    require => [User['kai'], File['/home/kai/.config']],
  }

  file { 'rofi_config':
    source => 'puppet:///modules/i3/config.rasi',
    path   => '/home/kai/.config/rofi/config.rasi',
  }

}
