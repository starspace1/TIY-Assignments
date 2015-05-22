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

  def self.named name
    #TODO: what if there is more than one restaurant with the same name?
    a = self.all.select{|r| r.name == name}
    return a[0]
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

