require 'test/unit'
require 'fileutils'
require_relative '../bin/ingo'

class TestIngo < Test::Unit::TestCase

  def test_asciidoc_link
    assert_equal('link:myref[mytext]', Class.new.extend(Ingo).asciidoc_link('myref', 'mytext'))
  end

  def test_output_file_name
    assert_equal('test.html', Class.new.extend(Ingo).output_file_name('test.adoc'))
  end

  def test_topics
    assert_equal(%w(a b c), Class.new.extend(Ingo).topics('test/fixtures/docs/foo/a.adoc'))
  end

  def test_list_of_topics
    expected = []
    expected << ''
    expected << 'Topics:'
    expected << ''
    expected << 'link:a-index.html[a] '
    expected << 'link:b-index.html[b] '
    expected << 'link:c-index.html[c] '
    expected << ''

    assert_equal(expected, Class.new.extend(Ingo).list_of_topics('test/fixtures/docs/foo/a.adoc'))
  end

  def test_run
    # when
    Class.new.extend(Ingo).run('test/fixtures')

    # expect
    actual_a = File.read 'test/fixtures/output/a.html'
    assert(actual_a.include?('Last updated '), 'Output does not contain a footer')
    assert(actual_a.include?('<a href="b-index.html">b</a>'), 'Output does not contain a index link')

    actual_b_index = File.read 'test/fixtures/output/b-index.html'
    assert(actual_b_index.include?('Last updated '), 'Output does not contain a footer')
    assert(actual_b_index.include?('<p><a href="a.html">a</a></p>'), 'Index file does not link to content file')


    # cleanup
    FileUtils.rm_r 'test/fixtures/output'
  end
end
