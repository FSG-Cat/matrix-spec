#! /bin/bash

set -ex

(cd event-schemas/ && ./check_examples.py)
(cd api && ./check_examples.py)
(cd scripts && ./gendoc.py -v)
(cd api && npm install && node validator.js -s "client-server/v1" && node validator.js -s "client-server/v2_alpha")
(cd event-schemas/ && ./check.sh)