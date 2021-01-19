class Instructor
    @@all = []

    def self.all
        @@all
    end

    attr_reader :name
    
    def initialize(name)
        @name = name
        save
    end

    def save
        self.class.all << self
    end

    def all_students
        Student.all.select { |student| student.all_instructors.include?(self) }
    end

    def passed_students
        passed_tests = tests.select { |test| test.status == "passed" }
        passed_tests.map { |test| test.student }
    end

    def tests
        BoatingTest.all.select { |test| test.instructor == self }
    end

    def find_test(student, test_name)
        tests.find { |test| test.test_name == test_name && test.student == student }
    end

    def pass_student(student, test_name)
        test = find_test(student, test_name)
        if test
            test.status = "passed"
            test
        else
            BoatingTest.new(student, self, test_name, "passed")
        end
    end

    def fail_student(student, test_name)
        test = find_test(student, test_name)
        if test
            test.status = "failed"
            test
        else
            BoatingTest.new(student, self, test_name, "failed")
        end
    end
end
