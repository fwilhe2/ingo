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
    if asciidoctor_document.attributes['topics']
      topics = asciidoctor_document.attributes['topics'].split(', ')
      topics.each do |t|
        lines << "#{asciidoc_link(t + '-index.html', t)} "
      end
    else
      puts "#{document} has no topics"
    end
    lines << ''

    lines
  end

  def convert_directory(base_directory)
    Dir.glob(File.join(base_directory, 'docs/**/*.adoc')) do |document|
      lines = File.readlines(document)
      lines += list_of_topics(document)
      ad_doc = Asciidoctor::Document.new(lines, header_footer: true, safe: 'unsafe')
      html = ad_doc.convert
      FileUtils.mkdir_p(File.join(base_directory, 'output'))
      File.open(File.join(base_directory, 'output', output_file_name(document)), 'w+') do |file|
        file.puts html
      end
    end
  end

  def create_index_files(base_directory)
    topics = populate_topics(base_directory)
    meta_index = <<END
= Index

END
    meta_index = write_indexes(base_directory, meta_index, topics)
    write_meta_index(base_directory, meta_index)
  end

  def populate_topics(base_directory)
    topics = Hash.new
    Dir.glob base_directory + '/docs/**/*.adoc' do |doc|
      asciidoctor_document = Asciidoctor.load_file doc
      if asciidoctor_document.attributes['topics']
        this_topics = asciidoctor_document.attributes['topics'].split(", ")
        this_topics.each do |t|
          if topics[t].nil?
            topics[t] = []
          end
          topics[t] << output_file_name(doc)
        end
      end
    end
    topics
  end

  def write_indexes(base_directory, meta_index, topics)
    topics.each do |t, docs|
      meta_index += "* #{asciidoc_link(t + '-index.html', t)}\n"
      index = <<END
== Index of #{t}

END
      docs.each do |doc|
        index += "* #{asciidoc_link(doc, File.basename(doc, '.*'))}\n"
      end
      html = Asciidoctor.convert(index, header_footer: true, safe: 'unsafe')
      File.open(base_directory + '/output/' + t + '-index.html', 'w') do |f|
        f.write(html)
      end
    end
    meta_index
  end

  def write_meta_index(base_directory, meta_index)
    html = Asciidoctor.convert(meta_index, header_footer: true, safe: 'unsafe')
    File.open(base_directory + '/output/index.html', 'w') do |f|
      f.write(html)
    end
  end

  def run(base_directory)
    convert_directory(base_directory)
    create_index_files(base_directory)
  end
end
