class run::php70 {
  file { '/usr/local/src/phpfarm/inst/php-7.0.6/etc/php-fpm.d/www.conf':
    ensure => present,
    content => template('run/www.conf.erb'),
    mode => 644
  }

  include run::php70::ini::realpath_cache_size
  include run::php70::ini::realpath_cache_ttl
  include run::php70::ini::timezone
  include run::php70::ini::post_max_size
  include run::php70::ini::upload_max_filesize
  include run::php70::ini::short_open_tag
  include run::php70::ini::max_execution_time
  include run::php70::ini::max_input_vars
  include run::php70::ini::memory_limit
  include run::php70::ini::display_errors
  include run::php70::ini::display_startup_errors
  include run::php70::ini::error_reporting
  include run::php70::ini::expose_php
  include run::php70::ini::allow_url_fopen

  if $php_ini_opcache == "On" {
    include run::php70::ini::opcache
  }

  if $php_ini_xdebug == "On" {
    include run::php70::ini::xdebug
  }

  if $php_ini_memcached == "On" {
    include run::php70::ini::memcached
  }
}
