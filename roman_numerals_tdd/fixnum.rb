class Fixnum

  def to_roman

    str_thousands = ""
    str_hundreds = ""
    str_tens = ""
    str_ones = ""

    one_digit_symbols = %w[I II III IV V VI VII VIII IX X]

    str_thousands = "M"*self.thousands_place

    case self.hundreds_place

    when (1..3) # 100=>C, 200=>CC, 300=>CCC
      str_hundreds = "C"*self.hundreds_place
    when(4) # 400=>CD
      str_hundreds = "CD"
    when (5..8) # 500=>D, 600=>DC, 700=>DCC, 800=>DCCC
      str_hundreds = "D" + "C"*(self.hundreds_place - 5)
    when (9) # 900=>CM
      str_hundreds = "CM"
      
    end


    case self.tens_place

    when (1..3) # 30=>XXX, 20=>XX, 10=>X
      str_tens = "X"*self.tens_place
    when (4) # 40 => XL
      str_tens = "XL" 
    when (5..8) # 50=>L, 60=>LX, 70=>LXX, 80=>LXXX
      str_tens = "L" + "X"*(self.tens_place - 5)
    when (9) # 90=>XC
      str_tens = "XC"

    end

    str_ones = one_digit_symbols[self.ones_place - 1] if self.ones_place != 0

    str_thousands + str_hundreds + str_tens + str_ones

  end

  def thousands_place
    self/1000
  end

  def hundreds_place
    self%1000/100
  end

  def tens_place
    self%100/10 
  end

  def ones_place
    self%10
  end

end
