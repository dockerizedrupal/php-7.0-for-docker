class build::php70::extensions {
  require build::php70

  include build::php70::extensions::xdebug
  include build::php70::extensions::memcached
  include build::php70::extensions::blackfire
}
