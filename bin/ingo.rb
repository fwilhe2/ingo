#!/usr/bin/env ruby

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
end
