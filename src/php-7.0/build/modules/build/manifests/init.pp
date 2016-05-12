class build {
  require build::user

  include build::php70
  include build::php70::extensions
  include build::freetds
  include build::composer
  include build::drush
  include build::postfix
  include build::cron
}
