require "webrick"
require "./restaurant"


server = WEBrick::HTTPServer.new(:Port => 8000)

@restaurants = Restaurant.all
@restaurants.each do |r|
  server.mount_proc "/#{r.name}" do |request, response|
    @selected_restaurant = r
    template = ERB.new(File.read "restaurant.html.erb")
    response.body = template.result
  end
end

server.mount_proc "/home" do |request, response|
    template = ERB.new(File.read "home.html.erb")
    response.body = template.result
end

server.mount_proc "/restaurants" do |request, response|
  @restaurants = Restaurant.all
  template = ERB.new(File.read "restaurants.html.erb")
  response.body = template.result
end

@cuisines = Restaurant.cuisine_types
@cuisines.each do |c|
  server.mount_proc "/#{c}" do |request, response|
    @restaurants = Restaurant.cuisine(c)
    template = ERB.new(File.read "restaurants.html.erb")
    response.body = template.result
  end
end

server.mount_proc "/cheap" do |request, response|
  @restaurants = Restaurant.cheap
  template = ERB.new(File.read "restaurants.html.erb")
  response.body = template.result
end

server.mount_proc "/high_avg_sort" do |request, response|
  @restaurants = Restaurant.sorted_by_avg_review
  template = ERB.new(File.read "restaurants.html.erb")
  response.body = template.result
end

server.mount_proc "/num_review_sort" do |request, response|
  @restaurants = Restaurant.sorted_by_num_reviews
  template = ERB.new(File.read "restaurants.html.erb")
  response.body = template.result
end

server.mount_proc "/shutdown" do |request, response|
  response.body = "Bye"
  server.shutdown
end

server.start

