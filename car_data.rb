class Car

  attr_reader :name, :gas_mileage, :n_cylinders, :horsepower, :weight, :quarter_mile_time, :salesman_name

  def initialize(name, gas_mileage, n_cylinders, horsepower, weight, quarter_mile_time)

    @name = name
    @gas_mileage = gas_mileage 
    @n_cylinders = n_cylinders
    @horsepower = horsepower
    @weight = weight*1000
    @quarter_mile_time = quarter_mile_time
    @salesman_name = "the "

    @salesman_name += "powerful " if horsepower > 200

    @salesman_name += "fuel efficient " if gas_mileage > 25

    @salesman_name += name #does it matter if we have @name or self.name here?

    def land_yacht?
      self.weight > 3500
    end

    def to_s
       "#{salesman_name}" #does it matter if we have self.salesman_name or @salesman_name here?
    end


  end

end

car_strings = IO.readlines("mtcars.csv")

cars = car_strings.map do |car_string|

  car_string.gsub!('"','')

  a_car_array = car_string.split(",")

    Car.new(a_car_array[0], a_car_array[1].to_i,
            a_car_array[2].to_i, a_car_array[4].to_i, 
            a_car_array[6].to_i, a_car_array[7]) 

end

puts "The car with the best gas mileage is #{cars.max_by{|car| car.gas_mileage}}."
puts

puts "The land yachts are:"
puts cars.select{|car| car.land_yacht?}
puts

puts "The quickest land yacht is #{cars.select{|car| car.land_yacht?}.min_by{|car| car.quarter_mile_time}}."
puts

#Gas mileage by number of cylinders

four_cyl_cars = cars.select{|car| car.n_cylinders == 4}

puts "The four cylinder cars are:"
puts four_cyl_cars
puts

best_mileage_4 = four_cyl_cars.max_by{|car| car.gas_mileage}
puts "The four cylinder car with the best gas mileage is #{best_mileage_4}."
puts

six_cyl_cars = cars.select{|car| car.n_cylinders == 6}

puts "The six cylinder cars are:"
puts six_cyl_cars
puts

best_mileage_6 = six_cyl_cars.max_by{|car| car.gas_mileage}
puts "The six cylinder car with the best gas mileage is #{best_mileage_6}."
puts

eight_cyl_cars = cars.select{|car| car.n_cylinders == 8}

puts "The eight cylinder cars are:"
puts eight_cyl_cars
puts

best_mileage_8 = eight_cyl_cars.max_by{|car| car.gas_mileage}
puts "The eight cylinder car with the best gas mileage is #{best_mileage_8}."
puts

best_gas_by_cyl = [best_mileage_4, best_mileage_6, best_mileage_8]


