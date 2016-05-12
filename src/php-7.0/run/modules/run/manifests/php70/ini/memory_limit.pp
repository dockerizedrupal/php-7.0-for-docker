class run::php70::ini::memory_limit {
  file { '/usr/local/src/phpfarm/inst/current/etc/conf.d/memory_limit.ini':
    ensure => present,
    content => template('run/php70/ini/memory_limit.ini.erb'),
    mode => 644
  }
}
