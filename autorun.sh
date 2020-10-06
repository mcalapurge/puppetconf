sudo dnf install -y puppet
read -p 'Puppet location: ' puppetconf
ln -s $puppetconf /puppet
puppet apply --modulepath=/puppet/modules /puppet/site/site.pp
