require 'json'

class Restaurant

  attr_reader :id, :name, :address, :website, :hours, :prices, :cuisines, :ratings

  #Instance Methods

  def initialize(id, name, address, website, hours, prices, cuisines, ratings)

    @id = id
    @name = name
    @address = address
    @website = website 
    @hours = hours 
    @prices = prices 
    @cuisines = cuisines 
    @ratings = ratings

  end

  def to_s
    "#{name}"
  end

  def is_cuisine cuisine_type
    cuisines.include? cuisine_type
  end

  def num_reviews i
    ratings.length == i
  end

  def avg_review
    sum = 0.0
    ratings.each {|i| sum += i.to_f}
    sum/ratings.length.to_f
  end

  def cheap?
   prices.max <= 10
 end

 def price_range
  "$#{prices[0]} - $#{prices[1]}"
end

def cuisine_types
  cuisines.join(", ")
end

def hours_on this_day
  begin
    "#{hours[this_day]["Open"]} - #{hours[this_day]["Closed"]}"
  rescue
    "Closed"
  end
end

def hours_today

  this_day = Time.now.wday

  case this_day

  when 0
    hours_on "Monday"
  when 1
    hours_on "Tuesday"
  when 2
   hours_on "Wednesday"
  when 3
    hours_on "Thursday"
  when 4
    hours_on "Friday"
  when 5
    hours_on "Saturday"
  when 6
    hours_on "Sunday"
  end

end

def open_now?

    #Get the current day and time 
    this_day = Time.now.wday
    this_time_float = Time.now.hour + (Time.now.min/60.0)

    begin
      case this_day
      when 0
        open_time_float = convert_time hours["Monday"]["Open"]
        close_time_float = convert_time hours["Monday"]["Closed"]
      when 1
        open_time_float = convert_time hours["Tuesday"]["Open"]
        close_time_float = convert_time hours["Tuesday"]["Closed"]
      when 2
        open_time_float = convert_time hours["Wednesday"]["Open"]
        close_time_float = convert_time hours["Wednesday"]["Closed"]
      when 3
        open_time_float = convert_time hours["Thursday"]["Open"]
        close_time_float = convert_time hours["Thursday"]["Closed"]
      when 4
        open_time_float = convert_time hours["Friday"]["Open"]
        close_time_float = convert_time hours["Friday"]["Closed"]
      when 5
        open_time_float = convert_time hours["Saturday"]["Open"]
        close_time_float = convert_time hours["Saturday"]["Closed"]
      when 6
        open_time_float = convert_time hours["Sunday"]["Open"]
        close_time_float = convert_time hours["Sunday"]["Closed"]
      end

    rescue this_time_float 

      return false

    end

    return this_time_float >= open_time_float && this_time_float <= close_time_float

  end

  def convert_time time_s
    is_am = time_s.include?("A") || time_s.include?("a")
    a = time_s.split(":")
    hour = a[0].to_f
    hour += 12.0 if !is_am
    a[1].gsub!(/[^0-9]/,'')
    minute = a[1].to_f
    time_float = hour + (minute/60.0)
  end

  #Class Methods

  def self.all

    data = JSON.parse(File.read "restaurants.json") #data is an array of hashes

    restaurants = data.map do |r| #this do loop will return an array of objects

      Restaurant.new(r["id"], r["name"], r["address"], r["website"], 
        r["hours"], r["price"], r["cuisines"], r["ratings"])

    end

  end

  def self.cuisine cuisine_type
    self.all.select{|r| r.is_cuisine cuisine_type}
  end

  def self.num_reviews num
    self.all.select{|r| r.num_reviews num}
  end

  def self.highest_avg_review
    self.all.max_by{|r| r.avg_review}
  end

  def self.cheap
    self.all.select{|r| r.cheap?}
  end

  def self.sorted_by_num_reviews
    self.all.sort_by{|r| r.ratings.size}.reverse
  end

  def self.sorted_by_avg_review
    self.all.sort_by{|r| r.avg_review}.reverse
  end

  def self.named name
    #TODO: what if there is more than one restaurant with the same name?
    a = self.all.select{|r| r.name == name}
    return a[0]
  end

  def self.cuisine_types

    Restaurant.all.map {|r| r.cuisines}.flatten.uniq

  end

  def self.open_now
    self.all.select{|r| r.open_now?}
  end

end

# puts "Breakfast & Brunch restaurants:"
# puts Restaurant.cuisine "Breakfast & Brunch"
# puts 

# puts "Restaurants with 10 reviews:"
# puts Restaurant.num_reviews 10
# puts

# puts "Highest average review:"
# puts Restaurant.highest_avg_review
# puts

# puts "Cheap restaurants:"
# puts Restaurant.cheap
# puts

# puts "Restaurants sorted by number of reviews:"
# puts Restaurant.sorted_by_num_reviews

# @selected_restaurant = Restaurant.named "Artisans Table"
# puts @selected_restaurant.name 

# puts "#{Restaurant.cuisine_types}"

