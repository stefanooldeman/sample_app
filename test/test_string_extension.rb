require './test_helper.rb'

class TestStringExtension < Test::Unit::TestCase 

  def is_implemented
      assert_nothing_thrown("shuffle method should be implemented") { "hello".shuffle } 
  end

  def returns_string
      assert_instance_of(String, "hello".shuffle, "shuffle should return string")
  end

  def same_length
      expected = "hello".length
      actualy = "hello".shuffle.length
      assert_equal(expected, actually, "shuffled string should be same length")
  end

end
