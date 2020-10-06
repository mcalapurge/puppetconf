class flat_packages {

  class {'flatpak': }

  flatpak::remote { 'flathub':
    remote_name => 'flathub',
    pakurl       => 'https://dl.flathub.org/repo/flathub.flatpakrepo',
  }~>
  flatpak::package { 'spotify':
    pakname        => 'com.spotify.Client',
    remote         => 'flathub',
    shortcut       => true,
    shortcut_name  => 'spotify',
  }~>
  flatpak::package { 'slack':
    pakname    => 'com.slack.Slack',
    remote     => 'flathub',
    shortcut    => true,
    shortcut_name  => 'slack',
  }~>
  flatpak::package { 'telegram':
    pakname    => 'org.telegram.desktop',
    remote     => 'flathub',
    shortcut    => true,
    shortcut_name  => 'telegram',
  }

}
