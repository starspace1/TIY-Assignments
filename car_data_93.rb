class Car

  attr_reader :make, :model, :type, :price

  def initialize(make, model, type, price)

    @make = make
    @model = model
    @type = type #Compact, Large, Midsize, Small, Sporty, Van
    @price = price

  end

  def to_s
   "#{make} #{model}"
  end

  def compact?
    type == "Compact"
  end

  def sporty?
    type == "Sporty"
  end

  def large?
    type == "Large"
  end

  def pontiac?
    make == "Pontiac"
  end

  def mazda?
    make == "Mazda"
  end

  def luxury?
    price > 30.0
  end

  def filter_by_type filt
    type == filt
  end


  def self.read_data

    car_strings = IO.readlines("Cars93.csv")
    car_strings.shift

    cars = car_strings.map do |car_string|

      car_string.gsub!('"','')

      a_car_array = car_string.split(",")

      Car.new(a_car_array[1], a_car_array[2], a_car_array[3], a_car_array[5].to_f)

    end

  end

end

cars = Car.read_data

puts cars.select{|car| car.filter_by_type "Large"}