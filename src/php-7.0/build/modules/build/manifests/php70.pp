class build::php70 {
  require build::php70::packages
  require build::php70::supervisor
  require build::phpfarm

  bash_exec { 'mkdir -p /usr/local/src/phpfarm/inst/php-7.0.14/etc/conf.d': }

  bash_exec { 'mkdir -p /usr/local/src/phpfarm/inst/php-7.0.14/etc/fpm.d': }

  bash_exec { 'mkdir -p /usr/local/src/phpfarm/inst/php-7.0.14/etc/pool.d': }

  bash_exec { 'mkdir -p /usr/local/src/phpfarm/inst/php-7.0.14/lib/php/extensions/no-debug-non-zts-20131226': }

  file { '/tmp/php-7.0.14.tar.gz':
    ensure => present,
    source => 'puppet:///modules/build/tmp/php-7.0.14.tar.gz'
  }

  bash_exec { 'cd /tmp && tar xzf php-7.0.14.tar.gz':
    require => File['/tmp/php-7.0.14.tar.gz']
  }

  bash_exec { 'mv /tmp/php-7.0.14 /usr/local/src/phpfarm/src/php-7.0.14':
    require => Bash_exec['cd /tmp && tar xzf php-7.0.14.tar.gz']
  }

  file { '/usr/local/src/phpfarm/src/custom/options-7.0.14.sh':
    ensure => present,
    source => 'puppet:///modules/build/usr/local/src/phpfarm/src/custom/options-7.0.14.sh',
    mode => 755,
    require => Bash_exec['mv /tmp/php-7.0.14 /usr/local/src/phpfarm/src/php-7.0.14']
  }

  bash_exec { '/usr/local/src/phpfarm/src/main.sh 7.0.14':
    timeout => 0,
    require => File['/usr/local/src/phpfarm/src/custom/options-7.0.14.sh']
  }

  bash_exec { 'rm -rf /usr/local/src/phpfarm/src/php-7.0.14':
    require => Bash_exec['/usr/local/src/phpfarm/src/main.sh 7.0.14']
  }

  file { '/usr/local/src/phpfarm/inst/php-7.0.14/etc/php-fpm.conf':
    ensure => present,
    source => 'puppet:///modules/build/usr/local/src/phpfarm/inst/php-7.0.14/etc/php-fpm.conf',
    mode => 644,
    require => Bash_exec['/usr/local/src/phpfarm/src/main.sh 7.0.14']
  }

  bash_exec { 'switch-phpfarm 7.0.14':
    require => Bash_exec['/usr/local/src/phpfarm/src/main.sh 7.0.14']
  }
}
