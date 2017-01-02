require "test/unit"
require_relative "../bin/ingo"

class TestIngo < Test::Unit::TestCase

  def test_asciidoc_link
    link = Ingo::AsciidocLink.new("myref", "mytext")
    assert_equal('link:myref[mytext]', link.to_s)
  end

end
