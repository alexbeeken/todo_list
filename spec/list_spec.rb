require('rspec')
require('spec_helper')
require('list')
require('task')
require('pg')

describe(List) do
  describe(".all") do
    it("starts off with no lists") do
      expect(List.all()).to(eq([]))
    end
  end

  describe("#name") do
    it("tells you its name") do
      list = List.new({:name => "Epicodus stuff", :id => nil})
      expect(list.name()).to(eq("Epicodus stuff"))
    end
  end

  describe("#id") do
    it("sets its ID when you save it") do
      list = List.new({:name => "Epicodus stuff", :id => nil})
      list.save()
      expect(list.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe("#save") do
    it("lets you save lists to the database") do
      list = List.new({:name => "Epicodus stuff", :id => nil})
      list.save()
      expect(List.all()).to(eq([list]))
    end
  end

  describe("#==") do
    it("is the same list if it has the same name") do
      list1 = List.new({:name => "Epicodus stuff", :id => nil})
      list2 = List.new({:name => "Epicodus stuff", :id => nil})
      expect(list1).to(eq(list2))
    end
  end

  describe(".order_by_dd") do
    it("lists in order by due date") do
    test_list = List.new({:name => "job search", :id => 1})
    test_task = Task.new({:description => "learn SQL", :list_id => 1, :due_date => "2015-01-25"})
    test_task.save()
    test_task2 = Task.new({:description => "2012", :list_id => 1, :due_date => "2012-02-15"})
    test_task2.save()
    order_list = test_list.order_by_dd()
    expect(order_list[0].description()).to(eq("2012"))
  end
 end
end
