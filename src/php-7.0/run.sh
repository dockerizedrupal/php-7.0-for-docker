#!/usr/bin/env bash

puppet apply --modulepath=/src/php-7.0/run/modules /src/php-7.0/run/run.pp

supervisord -c /etc/supervisor/supervisord.conf
