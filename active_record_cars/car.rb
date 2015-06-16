require 'active_record'

class Car < ActiveRecord::Base 

  establish_connection adapter: 'sqlite3',
                       database: 'cars.db' 

#Did I really want to delete all those methods?
#Is there a way to have the old class hybridized with the database stuff?
end