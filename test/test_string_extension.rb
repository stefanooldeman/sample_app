require 'active_support'
require 'rubygems'
require 'test/unit'

class TestStringExtension < Test::Unit::TestCase 

  def test_is_implemented
      assert_nothing_thrown("shuffle method should be implemented") { "hello".shuffle } 
  end

  def test_returns_string
      assert_instance_of(String, "hello".shuffle, "shuffle should return string")
  end

  def test_same_length
      expected = "hello".length
      actually = "hello".shuffle.length
      assert_equal(expected, actually, "shuffled string should be same length")
  end

end
