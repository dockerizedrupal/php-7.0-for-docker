class run::php70::ini::sys_temp_dir {
  file { '/usr/local/src/phpfarm/inst/current/etc/conf.d/sys_temp_dir.ini':
    ensure => present,
    content => template('run/php70/ini/sys_temp_dir.ini.erb'),
    mode => 644
  }
}
