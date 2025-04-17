#!/bin/bash
DIR="$(cd "$(dirname "src/build-asciidoctor-package.sh")" && pwd)"
export GEM_HOME="$DIR/gems"
export PATH="$DIR/rubies/ruby-3.4.3/bin:$PATH"
"$DIR/rubies/ruby-3.4.3/bin/ruby" "$DIR/src/main.rb" "$@"
