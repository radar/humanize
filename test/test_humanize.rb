require 'rubygems'
require 'test/unit'
require 'humanize'

class TestHumanize < Test::Unit::TestCase
  def test_1_is_one
    assert_equal "one", 1.humanize
  end
  
  def test_11_is_eleven
    assert_equal "eleven", 11.humanize
  end
  
  def test_21_is_twenty_one
    assert_equal "twenty one", 21.humanize
  end
  
  def test_100_is_one_hundred
    assert_equal "one hundred", 100.humanize 
  end
  
  def test_101_is_one_hundred_and_one
    assert_equal "one hundred and one", 101.humanize
  end
  
  def test_111_is_one_hundred_and_eleven
    assert_equal "one hundred and eleven", 111.humanize 
  end
  
  def test_121_is_one_hundred_and_twenty_one
    assert_equal "one hundred and twenty one", 121.humanize
  end
  
  def test_1079_is_one_thousand_and_seventy_nine
    assert_equal "one thousand and seventy nine", 1079.humanize
  end
  
  def test_10079_is_one_thousand_and_seventy_nine
    assert_equal "ten thousand and seventy nine", 10079.humanize
  end
  
  # WROOOOOOOOOOOOOOOONG
  def test_235409_is_two_hundred_and_thirty_five_thousand_four_hundred_and_nine
    assert_equal "two hundred and thirty five thousand and four hundred and nine", 235409.humanize
  end
end
  
  
  