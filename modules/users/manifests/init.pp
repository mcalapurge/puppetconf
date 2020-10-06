class users {

  #create user kai as root user
  user { 'kai':
    require    => Package['zsh'],
    ensure     => 'present',
    groups     => 'wheel',
    gid        => '1000',
    uid        => '573',
    shell      => '/bin/zsh',
    home       => '/home/kai',
    managehome => true,
    password   => 'XYZ',
  }~>
  file { '/home/kai/.config':
  ensure => 'directory',
  owner  => 'kai',
  }~>
  
  ohmyzsh::install { ['kai']: }~>
  ohmyzsh::plugins { 'kai': plugins => 'git github' }~>
  file { 'mcalapurge_zsh_theme':
    require  => User['kai'],
    source   => 'puppet:///modules/users/mcalapurge.zsh-theme',
    path     => '/home/kai/.oh-my-zsh/themes/mcalapurge.zsh-theme',
    ensure   => 'present',
  }

  file { '.zshrc':
    require => User['kai'],
    source  => 'puppet:///modules/users/zshrc',
    path    => '/home/kai/.zshrc',
    ensure  => 'present',
  }
}

