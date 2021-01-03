#! /bin/bash

set -o errexit -o nounset -o pipefail

asciidoctor \
    -b html5 \
	--out-file index.html \
	--trace \
	drupal-widget-guide.adoc
