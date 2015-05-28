require "webrick"
require "./car"

@filters = ["ford", "mazda", "sporty", "luxury", "fuel_efficient", "domestic", "foreign"]
@this_filter = ""

server = WEBrick::HTTPServer.new(:Port => 8000)

server.mount_proc "/home" do |request, response| #can just put "/" instead of "/home" and then localhost:8000/ will point to home
  template = ERB.new(File.read "../home.html.erb")
  response.body = template.result
end

server.mount_proc "/ford" do |request, response|
  @cars = Car.where make: "Ford"
  @this_filter = "Ford"
  template = ERB.new(File.read "template.html.erb")
  response.body = template.result

end

server.mount_proc "/mazda" do |request, response|
  @cars = Car.where make: "Mazda"
  @this_filter = "Mazda"
  template = ERB.new(File.read "template.html.erb")
  response.body = template.result

end

server.mount_proc "/sporty" do |request, response|
  @cars = Car.where category: "Sporty"
  @this_filter = "Sporty"
  template = ERB.new(File.read "template.html.erb")
  response.body = template.result

end

server.mount_proc "/luxury" do |request, response|
  @cars = Car.where('min_price >= 30.0')
  @this_filter = "Luxury"
  template = ERB.new(File.read "template.html.erb")
  response.body = template.result

end

server.mount_proc "/fuel_efficient" do |request, response|
  @cars = Car.where('highway_mpg >= 30')
  @this_filter = "Fuel Efficient"
  template = ERB.new(File.read "template.html.erb")
  response.body = template.result
end


server.mount_proc "/domestic" do |request, response|
  @cars = Car.where origin: "USA"
  @this_filter = "Domestic"
  template = ERB.new(File.read "template.html.erb")
  response.body = template.result
end

server.mount_proc "/foreign" do |request, response|
  @cars = Car.where origin: "non-USA"
  @this_filter = "Foreign"
  template = ERB.new(File.read "template.html.erb")
  response.body = template.result
end

# /new_car (show the form)
 server.mount_proc "/new_car" do |request, response|
  template = ERB.new(File.read "new_car.html")
  response.body = template.result
end

# /create_car (process the form)
 server.mount_proc "/create_car" do |request, response|
  @car = Car.create(request.query)
  template = ERB.new(File.read "new_car.html.erb")
  response.body = template.result
end


server.mount_proc "/shutdown" do |request, response|
  response.body = "Bye"
  server.shutdown
end


server.start