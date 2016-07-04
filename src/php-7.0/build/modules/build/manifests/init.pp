class build {
  require build::user

  include build::php70
  include build::php70::extensions
  include build::composer
  include build::drush
  include build::phpcs
  include build::phpcs::phpcompatibility
  include build::phpcs::coder
  include build::postfix
  include build::cron
  include build::drupal_console
}
