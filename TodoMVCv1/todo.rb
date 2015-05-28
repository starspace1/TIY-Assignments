require 'active_record'

class Todo < ActiveRecord::Base 

  establish_connection adapter: 'sqlite3',
                       database: 'todomvc.db' 
end