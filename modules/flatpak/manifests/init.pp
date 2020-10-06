class flatpak {

  package { 'flatpak':
    ensure => installed,
  }

}
define flatpak::remote (
  $pakurl       = '',
  $remote_name  = '',
  ){

  exec { "flatpak-${remote_name}":
    command => "/usr/bin/flatpak remote-add --if-not-exists ${remote_name} ${pakurl}",
  }

}

define flatpak::package (
  $pakname       = '',
  $remote        = '',
  $shortcut      = true,
  $shortcut_name = '',
){

  exec { "flatpak-${pakname}":
    command => "/usr/bin/flatpak install -y ${remote} ${pakname}",
    timeout => 10000,
  }

  if $shortcut == true {
    file { "/opt/${shortcut_name}.sh":
      content => "flatpak run ${pakname}",
      ensure  => 'present',
      mode    => '0777',
    }~>
    file { "/usr/bin/${shortcut_name}":
      ensure => 'link',
      source => "/opt/${shortcut_name}.sh",
      mode   => '0777',
    }  
  }

}

