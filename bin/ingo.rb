#!/usr/bin/env ruby

require 'asciidoctor'
require 'fileutils'

module Ingo

  def asciidoc_link(reference, text)
    "link:#{reference}[#{text}]"
  end

  def output_file_name(input_file_name)
    File.basename(input_file_name, '.*') + '.html'
  end

  def topics(document)
    Asciidoctor.load_file(document).attributes['topics'].split(", ")
  end

end
