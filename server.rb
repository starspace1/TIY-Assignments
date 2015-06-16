require "webrick"
require "./car_data_93"

@filters = ["compact", "sporty", "large", "mazda", "pontiac", "luxury"]
@this_filter = ""

server = WEBrick::HTTPServer.new(:Port => 8000)

server.mount_proc "/home" do |request, response|
  template = ERB.new(File.read "home.html.erb")
  response.body = template.result
end

@filters.each do |f|
  server.mount_proc "/#{f}" do |request, response|
    @cars = Car.read_data
    @cars = @cars.select{|car| car.send("#{f}" + "?")}
    @this_filter = f
    template = ERB.new(File.read "template.html.erb")
    response.body = template.result
  end

end

server.mount_proc "/shutdown" do |request, response|
  response.body = "Bye"
  server.shutdown
end


server.start