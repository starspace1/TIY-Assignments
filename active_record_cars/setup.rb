require 'active_record'
require './car'

ActiveRecord::Base.establish_connection adapter: 'sqlite3', 
database: 'cars.db'

ActiveRecord::Base.connection.create_table 'cars', 
force: true do |table|
  table.string :make
  table.string :model
  table.string :category
  table.float :min_price
  table.integer :highway_mpg
end


car_strings = IO.readlines("../Cars93.csv")
car_strings.shift

cars = car_strings.map do |car_string|

  car_string.gsub!('"','')

  a_car_array = car_string.split(",")

  Car.create(make: a_car_array[1], 
             model: a_car_array[2], 
             category: a_car_array[3], 
             min_price: a_car_array[4].to_f, 
             highway_mpg: a_car_array[8].to_i)

end

