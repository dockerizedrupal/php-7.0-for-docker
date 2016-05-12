class build::php70::extensions::xdebug {
  require build::php70

  file { '/tmp/xdebug-2.4.0rc3.tgz':
    ensure => present,
    source => 'puppet:///modules/build/tmp/xdebug-2.4.0rc3.tgz'
  }

  bash_exec { 'cd /tmp && tar xzf xdebug-2.4.0rc3.tgz':
    require => File['/tmp/xdebug-2.4.0rc3.tgz']
  }

  bash_exec { 'cd /tmp/xdebug-2.4.0RC3 && phpize-7.0.6':
    require => Bash_exec['cd /tmp && tar xzf xdebug-2.4.0rc3.tgz']
  }

  bash_exec { 'cd /tmp/xdebug-2.4.0RC3 && ./configure --with-php-config=/usr/local/src/phpfarm/inst/bin/php-config-7.0.6':
    timeout => 0,
    require => Bash_exec['cd /tmp/xdebug-2.4.0RC3 && phpize-7.0.6']
  }

  bash_exec { 'cd /tmp/xdebug-2.4.0RC3 && make':
    timeout => 0,
    require => Bash_exec['cd /tmp/xdebug-2.4.0RC3 && ./configure --with-php-config=/usr/local/src/phpfarm/inst/bin/php-config-7.0.6']
  }

  bash_exec { 'cd /tmp/xdebug-2.4.0RC3 && make install':
    timeout => 0,
    require => Bash_exec['cd /tmp/xdebug-2.4.0RC3 && make']
  }
}
