class build::mysql {
  file { '/etc/mysql/my.cnf':
    ensure => present,
    source => 'puppet:///modules/build/etc/mysql/my.cnf',
    mode => 644
  }
}
