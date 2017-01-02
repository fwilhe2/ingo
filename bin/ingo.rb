#!/usr/bin/env ruby

require 'fileutils'

module Ingo
  class AsciidocLink

    def initialize(reference, text)
      @reference = reference
      @text = text
    end

    def to_s
      "link:#{@reference}[#{@text}]"
    end
  end

  def output_file_name(input_file_name)
    File.basename(input_file_name, '.*') + '.html'
  end

end
