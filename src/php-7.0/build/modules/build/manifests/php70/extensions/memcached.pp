class build::php70::extensions::memcached {
  require build::php70
  require build::php70::extensions::igbinary

  file { '/tmp/libmemcached-1.0.18.tar.gz':
    ensure => present,
    source => 'puppet:///modules/build/tmp/libmemcached-1.0.18.tar.gz'
  }

  bash_exec { 'cd /tmp && tar xzf libmemcached-1.0.18.tar.gz':
    require => File['/tmp/libmemcached-1.0.18.tar.gz']
  }

  bash_exec { 'cd /tmp/libmemcached-1.0.18 && ./configure':
    timeout => 0,
    require => Bash_exec['cd /tmp && tar xzf libmemcached-1.0.18.tar.gz']
  }

  bash_exec { 'cd /tmp/libmemcached-1.0.18 && make':
    timeout => 0,
    require => Bash_exec['cd /tmp/libmemcached-1.0.18 && ./configure']
  }

  bash_exec { 'cd /tmp/libmemcached-1.0.18 && make install':
    timeout => 0,
    require => Bash_exec['cd /tmp/libmemcached-1.0.18 && make']
  }

  file { '/tmp/php-memcached-php7.zip':
    ensure => present,
    source => 'puppet:///modules/build/tmp/php70/extensions/memcached/php-memcached-php7.zip',
    require => Bash_exec['cd /tmp/libmemcached-1.0.18 && make install']
  }

  bash_exec { 'cd /tmp && unzip php-memcached-php7.zip':
    require => File['/tmp/php-memcached-php7.zip']
  }

  bash_exec { 'cd /tmp/php-memcached-php7 && phpize-7.0.8':
    require => Bash_exec['cd /tmp && unzip php-memcached-php7.zip']
  }

  bash_exec { 'cd /tmp/php-memcached-php7 && ./configure --with-php-config=/usr/local/src/phpfarm/inst/bin/php-config-7.0.8 --enable-memcached-igbinary':
    timeout => 0,
    require => Bash_exec['cd /tmp/php-memcached-php7 && phpize-7.0.8']
  }

  bash_exec { 'cd /tmp/php-memcached-php7 && make':
    timeout => 0,
    require => Bash_exec['cd /tmp/php-memcached-php7 && ./configure --with-php-config=/usr/local/src/phpfarm/inst/bin/php-config-7.0.8 --enable-memcached-igbinary']
  }

  bash_exec { 'cd /tmp/php-memcached-php7 && make install':
    timeout => 0,
    require => Bash_exec['cd /tmp/php-memcached-php7 && make']
  }
}
