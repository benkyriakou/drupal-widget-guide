#! /bin/bash

set -o errexit -o nounset -o pipefail

asciidoctor \
    -b html5 \
	--out-file index.html \
	--trace \
	drupal-widget-guide.adoc

HEAD="$(sed '/<\/head>/q' index.html | head -n -1)"
HEADCOUNT=$(( "$(echo "$HEAD" | wc -l)" + 1))
FOOT="$(tail -n +${HEADCOUNT} index.html)"

echo "$HEAD" > index.html
cat "templates/styles.html" >> index.html
cat "templates/buymeacoffee.html" >> index.html
cat "templates/google-analytics.html" >> index.html
echo "$FOOT" >> index.html
