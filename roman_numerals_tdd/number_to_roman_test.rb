require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './fixnum'

class NumbertoRomanTest < MiniTest::Test

  # want to be able to change a roman numeral to its Roman Numeral equivalent (ex: 1 --> I etc)

  def test_1_becomes_I
    assert_equal "I", 1.to_roman
  end

  def test_2_becomes_II
    assert_equal "II", 2.to_roman
  end

  def test_3_becomes_III
    assert_equal "III", 3.to_roman
  end

  def test_4_becomes_IV
    assert_equal "IV", 4.to_roman
  end

  def test_5_becomes_V
    assert_equal "V", 5.to_roman
  end

  def test_6_becomes_VI
    assert_equal "VI", 6.to_roman
  end

  def test_7_becomes_VII
    assert_equal "VII", 7.to_roman
  end

  def test_8_becomes_VIII
    assert_equal "VIII", 8.to_roman
  end

  def test_9_becomes_IX
    assert_equal "IX", 9.to_roman
  end

  def test_10_becomes_X
    assert_equal "X", 10.to_roman
  end

  def test_15_becomes_XV
    assert_equal "XV", 15.to_roman
  end

  def test_19_becomes_XIX
    assert_equal "XIX", 19.to_roman
  end

  def test_20_becomes_XX
    assert_equal "XX", 20.to_roman
  end

  def test_30_becomes_XXX
    assert_equal "XXX", 30.to_roman
  end

  def test_40_becomes_XL
    assert_equal "XL", 40.to_roman
  end

  def test_49_becomes_XLIX
    assert_equal "XLIX", 49.to_roman
  end

  def test_50_becomes_L
    assert_equal "L", 50.to_roman
  end

  def test_54_becomes_LIV
    assert_equal "LIV", 54.to_roman
  end

  def test_60_becomes_LX
    assert_equal "LX", 60.to_roman
  end

  def test_70_becomes_LXX
    assert_equal "LXX", 70.to_roman
  end

  def test_80_becomes_LXXX
    assert_equal "LXXX", 80.to_roman
  end

  def test_90_becomes_XC
    assert_equal "XC", 90.to_roman
  end

  def test_100_becomes_C
    assert_equal "C", 100.to_roman
  end

  def test_200_becomes_CC
    assert_equal "CC", 200.to_roman
  end

  def test_300_becomes_CCC
    assert_equal "CCC", 300.to_roman
  end

  def test_400_becomes_CD
    assert_equal "CD", 400.to_roman
  end

  def test_451_becomes_CDLI
    assert_equal "CDLI", 451.to_roman
  end

  def test_500_becomes_D
    assert_equal "D", 500.to_roman
  end

  def test_569_becomes_DLXIX
    assert_equal "DLXIX", 569.to_roman
  end

  def test_600_becomes_DC
    assert_equal "DC", 600.to_roman
  end

  def test_700_becomes_DCC
    assert_equal "DCC", 700.to_roman
  end

  def test_800_becomes_DCCC
    assert_equal "DCCC", 800.to_roman
  end

  def test_900_becomes_CM
    assert_equal "CM", 900.to_roman
  end

  def test_1000_becomes_M
    assert_equal "M", 1000.to_roman
  end

  def test_1589_becomes_MDLXXXIX
    assert_equal "MDLXXXIX", 1589.to_roman
  end

  def test_2500_becomes_MMD
    assert_equal "MMD", 2500.to_roman
  end

  def test_4999_becomes_MMMMCMXCIX
    assert_equal "MMMMCMXCIX", 4999.to_roman
  end


end