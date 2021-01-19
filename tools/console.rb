require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

student1 = Student.new("spongebob")
student2 = Student.new("patrick")
teacher1 = Instructor.new("mrs. puff")
teacher2 = Instructor.new("mr. butt-kicker")
test1 = BoatingTest.new(student1, teacher1, "brake test", "failed")
test2 = BoatingTest.new(student1, teacher2, "butt-kick endurance test", "failed")
student1.add_boating_test("retry test", "passed", teacher2)
student2.add_boating_test("dummy test", "super-failed", teacher1)

binding.pry
0 #leave this here to ensure binding.pry isn't the last line

