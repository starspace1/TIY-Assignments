require 'active_record'
require './todo'

ActiveRecord::Base.establish_connection adapter: 'sqlite3',
                                        database: 'todomvc.db'

ActiveRecord::Base.connection.create_table 'todos',
  force: true do |table|
    table.string :title
    table.boolean :is_complete
  end
