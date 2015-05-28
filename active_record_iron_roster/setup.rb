# Delete the iron_roster.db file. 
# Now recreate it (in its initial form) by writing and running code in setup.rb 
# which takes the data from the iron_roster.csv file, parses it, and creates Person instances from it.

require 'active_record'
require './person'

ActiveRecord::Base.establish_connection adapter: 'sqlite3', 
                       database: 'iron_roster.db'

ActiveRecord::Base.connection.create_table 'people', 
  force: true do |table|
    table.string :subject
    table.string :github_account
    table.string :name
    table.boolean :student
  end

  people_strings = IO.readlines("iron_roster.csv")
  people_strings.shift

  people = people_strings.map do |person_string|

    person_string.gsub!('"','')

    a_person_array = person_string.split(",")

    Person.create(subject: a_person_array[0], github_account: a_person_array[1], name: a_person_array[2], student: a_person_array[3].chomp)

  end

