require('spec_helper')


describe(Employee) do
  it("tells which division it belongs to") do
    r_and_d = Division.create({:name => "Research"})
    frank = Employee.create({:name => "Frank", :division_id => r_and_d.id})
    expect(frank.division()).to(eq(r_and_d))
  end
end
  # describe(".not_done") do
  #   it("returns the not done tasks") do
  #     not_done_task1 = Task.create({:description => "gotta do it", :done => false})
  #     not_done_task2 = Task.create({:description => "gotta do it too", :done => false})
  #     not_done_tasks = [not_done_task1, not_done_task2]
  #     done_task = Task.create({:description => "done task", :done => true})
  #     expect(Task.not_done()).to(eq(not_done_tasks))
  #   end
  # end
