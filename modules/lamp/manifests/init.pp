class lamp {
  
  #install lamp packages
  $lamp_packages = ['php', 'mysql', 'httpd', 'apache2']
  package { $lamp_packages: ensure => 'installed'}

}


