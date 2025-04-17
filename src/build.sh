#!/bin/bash
set -e
sudo apt install makeself
# Define working directory
DIR="$(cd "$(dirname "$0")" && pwd)"
mkdir -p build
# Download and unpack portable Ruby
cd "build"
if [ ! -f ruby-3.1.2-x86_64-linux.tar.gz ]; then
  wget https://github.com/postmodern/ruby-install/releases/download/v0.10.1/ruby-install-0.10.1.tar.gz
fi
tar -xzf ruby-install-0.10.1.tar.gz
mv ruby-install-0.10.1 ruby-install

ruby-install/bin/ruby-install --rubies-dir rubies ruby 3.4.3

# Export local Ruby to PATH
export PATH="build/ruby/bin:$PATH"
echo $PATH

# Install gems locally
gem install --install-dir "gems" asciidoctor
gem install --install-dir "gems" asciidoctor-html5s

# Package with makeself
cd ..
makeself --notemp "$DIR" build/asciidoctor.run "Portable Asciidoctor CLI" src/run.sh
