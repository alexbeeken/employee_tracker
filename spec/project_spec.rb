require('spec_helper')


describe(Project) do
  it("tells which employee it belongs to") do
    frank = Employee.create({:name => "Frank"})
    make_website = frank.project.new({:name => "Make website"})
    expect(frank.projects()).to(eq([ make_website ]))
  end
end
