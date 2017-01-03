require "test/unit"
require_relative "../bin/ingo"

class TestIngo < Test::Unit::TestCase

  def test_asciidoc_link
    assert_equal('link:myref[mytext]', Class.new.extend(Ingo).asciidoc_link('myref', 'mytext'))
  end

  def test_output_file_name
    assert_equal('test.html', Class.new.extend(Ingo).output_file_name('test.adoc'))
  end

end
