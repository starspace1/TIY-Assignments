require 'active_record'

class Car < ActiveRecord::Base 

  establish_connection adapter: 'sqlite3',
                       database: 'cars.db' 

  # attr_reader :make, :model, :type, :price

  # def initialize(make, model, type, price)

  #   @make = make
  #   @model = model
  #   @type = type #Compact, Large, Midsize, Small, Sporty, Van
  #   @price = price

  # end

  # def to_s
  #  "#{make} #{model}"
  # end

  # def compact?
  #   type == "Compact"
  # end

  # def sporty?
  #   type == "Sporty"
  # end

  # def large?
  #   type == "Large"
  # end

  # def pontiac?
  #   make == "Pontiac"
  # end

  # def mazda?
  #   make == "Mazda"
  # end

  # def luxury?
  #   price > 30.0
  # end

  # def filter_by_type filt
  #   type == filt
  # end

end