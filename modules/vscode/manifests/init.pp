class vscode {
  
  yumrepo { 'vscode_repo':
    enabled    => 1,
    descr      => 'Microsoft vscode repo',
    baseurl    => 'https://packages.microsoft.com/yumrepos/vscode',
    gpgcheck   => 0,
  }

  package { 'code':
    require => Yumrepo['vscode_repo'],
    ensure  => 'installed',
  }~>
  file { '/home/kai/.config/Code':
    require => [Package['code'], User['kai']],
    ensure  => 'directory',
    owner   => '573',
  }~>
  file { '/home/kai/.config/Code/User':
    require => [Package['code'], User['kai']],
    source  => 'puppet:///modules/vscode/User',
    ensure  => 'directory',
    owner   => '573',
  }~>
  file { '/home/kai/extentions.sh':
    owner   => '573',
    source  => 'puppet:///modules/vscode/extentions.sh',
    path    => '/home/kai/extentions.sh',
    ensure  => 'present',
  }#~>
  # exec { 'vscode_extentions':
  #   user    => '573',
  #   command => '/usr/bin/sh /home/kai/extentions.sh',
  #   timeout => 100000,
  # }

}

