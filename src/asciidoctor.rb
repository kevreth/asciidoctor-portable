#!/usr/bin/env ruby
require 'asciidoctor'
require 'asciidoctor-html5s'

if ARGV[0]
  html = Asciidoctor.convert_file ARGV[0],
    safe: :safe,
    backend: 'html5s',
    header_footer: false,
    to_file: false,
    attributes: { 'showtitle' => true }
else
  input = STDIN.read
  html = Asciidoctor.convert input,
    safe: :safe,
    backend: 'html5s',
    header_footer: false,
    to_file: false,
    attributes: { 'showtitle' => true }
end
puts html