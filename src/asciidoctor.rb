#!/usr/bin/env ruby
require 'asciidoctor'
require 'asciidoctor-html5s'

input = ARGV[0] or abort("Usage: ./asciidoctor input.adoc")
html = Asciidoctor.convert_file input,
  safe: :safe,
  backend: 'html5s',
  header_footer: false,
  to_file: false,
  attributes: { 'showtitle' => true }
puts html