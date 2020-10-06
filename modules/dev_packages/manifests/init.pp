class dev_packages {

  #install devlopment packags
  $base_packages = ['gcc', 'perl', 'python', 'nodejs', 'emacs']
  package { $base_packages: ensure => installed }


}
