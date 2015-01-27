require('sinatra')
require('sinatra/reloader')
also_reload("lib/**/*.rb")
require("sinatra/activerecord")
require("./lib/employee")
require("./lib/division")
require("pg")
require('pry')


get('/') do
  @employees = Employee.all()
  @divisions = Division.all()
  erb(:index)
end

post('/employees') do
  name = params.fetch('name')
  @employee = Employee.new({:name => name})
  @employee.save()
  redirect back
end

post('/division') do
  name = params.fetch('name')
  @division = Division.new({:name => name})
  @division.save()
  redirect back
end

get('/employee/:id/edit') do
  @employee = Employee.find(params.fetch("id").to_i())
  erb(:employee_edit)
end

patch("/employee/:id") do
  name = params.fetch("name")
  @employee = Employee.find(params.fetch("id").to_i())
  @employee.update({:name => name})
  @employees = Employee.all()
  erb(:index)
end

get('/division/:id/edit') do
  @division = Division.find(params.fetch("id").to_i())
  erb(:division_edit)
end

patch("/division/:id") do
  name = params.fetch("name")
  @division = Division.find(params.fetch("id").to_i())
  @division.update({:name => name})
  @divisions = Division.all()
  @employees = Employee.all()
  erb(:index)
end

post("/associate_division") do
  employee = Employee.find(params.fetch("emp_id").to_i)
  id = params.fetch("id").to_i
  employee.update({:division_id => id})
  @employees = Employee.all()
  @divisions = Division.all()
  redirect '/'
end
