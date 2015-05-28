require "webrick"
require "./person"

server = WEBrick::HTTPServer.new(:Port => 8000)

 # /home (list everyone on the roster)
server.mount_proc "/home" do |request, response| #can just put "/" instead of "/home" and then localhost:8000/ will point to home
  @people = Person.all
  template = ERB.new(File.read "people.html.erb")
  response.body = template.result
end

 # /rails (list our class)
server.mount_proc "/rails" do |request, response|
  @people = Person.where subject: "ROR"
  template = ERB.new(File.read "people.html.erb")
  response.body = template.result
end


 # /fee (list those other people - you know, the ones we never talk to)
server.mount_proc "/fee" do |request, response|
  @people = Person.where subject: "FEE"
  template = ERB.new(File.read "people.html.erb")
  response.body = template.result
end

 # /students (all of you together)
server.mount_proc "/students" do |request, response|
  @people = Person.where student: true
  template = ERB.new(File.read "people.html.erb")
  response.body = template.result
end

 # /staff (me, David, Ben, Kyle, and The Pixie)
server.mount_proc "/staff" do |request, response|
  @people = Person.where student: false
  template = ERB.new(File.read "people.html.erb")
  response.body = template.result
end

 # /new_student_form
 server.mount_proc "/new_student_form" do |request, response|
  template = ERB.new(File.read "new_student.html")
  response.body = template.result
end

 # /create_student (add a student to the database using form data, and have a link back to /home)
 server.mount_proc "/create_student" do |request, response|
  @person = Person.create(request.query)
  template = ERB.new(File.read "new_student.html.erb") #Is there a way to just put an html link here rather than creating a new, minimal .html.erb file?
  response.body = template.result
end

 server.mount_proc "/shutdown" do |request, response|
  response.body = "Bye"
  server.shutdown
end

server.start