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
    Asciidoctor.load_file(document).attributes['topics'].split(', ')
  end

  def list_of_topics(document)
    lines = []
    lines << ''
    lines << 'Topics:'
    lines << ''
    asciidoctor_document = Asciidoctor.load_file(document)
    topics = asciidoctor_document.attributes['topics'].split(', ')
    topics.each do |t|
      lines << "#{asciidoc_link(t + '-index.html', t)} "
    end
    lines << ''

    lines
  end

  def convert_directory(base_directory)
    Dir.glob base_directory + '/docs/**/*.adoc' do |document|
      lines = File.readlines(document)
      lines += list_of_topics(document)
      ad_doc = Asciidoctor::Document.new(lines, header_footer: true, safe: 'unsafe')
      html = ad_doc.convert
      FileUtils.mkdir_p(base_directory + "/output")
      File.open(base_directory + '/output/' + output_file_name(document), "w+") do |file|
        file.puts html
      end
    end
  end
end

#base_dir = ARGV[0]
#Class.new.extend(Ingo).convert_directory(base_dir)
