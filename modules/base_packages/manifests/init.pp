
class base_packages {

  #install base packags
  $base_packages = ['htop', 'vim', /* 'krita', 'blender', 'inkscape', 'darktable',*/ 'thunderbird', 'filezilla', 'gimp']
  package { $base_packages: ensure => 'installed', }

  #configure git username + email
  # exec { 'git_config_user.name':
  #   require => [Package['git'], User['kai']],
  #   command => '/usr/bin/git config --global user.name "Alexander Harris"',
  #   user    => '573',
  # }
  # exec { 'git_config_user.email':
  #   require => [Package['git'], User['kai']],
  #   command => '/usr/bin/git config --global user.email "mcalapurge@techie.com"',
  #   user    => '573',
  # }
}
