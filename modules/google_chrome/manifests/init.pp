class google_chrome {

  yumrepo { 'google_chrome':
    enabled    => 1,
    baseurl    => 'http://dl.google.com/linux/chrome/rpm/stable/x86_64',
    descr      => 'Google Chrome',
    gpgcheck   => 0,
  }


  package { 'google-chrome-stable':
    ensure  => 'installed',
  }
  package { 'google-chrome':
    ensure  => 'installed',
  }



}
