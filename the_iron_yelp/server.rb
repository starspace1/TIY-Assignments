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
  response.body = File.read "home.html"
end

server.mount_proc "/restaurants" do |request, response|
  @restaurants = Restaurant.all
  template = ERB.new(File.read "restaurants.html.erb")
  response.body = template.result
end

server.mount_proc "/cheap" do |request, response|
  @restaurants = Restaurant.cheap
  template = ERB.new(File.read "restaurants.html.erb")
  response.body = template.result
end

server.mount_proc "/vegetarian" do |request, response|
  @restaurants = Restaurant.cuisine "Vegetarian"
  template = ERB.new(File.read "restaurants.html.erb")
  response.body = template.result
end

server.mount_proc "/shutdown" do |request, response|
  response.body = "Bye"
  server.shutdown
end

server.start

