require('spec_helper')

describe(Division) do
  it("tells which employees are in it") do
    graphics = Division.create({:name => "Graphics"})
    sue = Employee.create({:name => "Sue", :division_id => graphics.id})
    sean = Employee.create({:name => "Sean", :division_id => graphics.id})
   expect(graphics.employees()).to(eq([sue, sean]))
  end
end
