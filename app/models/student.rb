class Student
    @@all = []

    def self.all
        @@all
    end

    def self.find_student(name)
        self.all.find { |student| student.name == name }
    end

    attr_reader :name

    def initialize(name)
        @name = name
        save
    end

    def save
        self.class.all << self
    end

    def add_boating_test(test_name, status, instructor)
        BoatingTest.new(self, instructor, test_name, status)
    end

    def tests
        BoatingTest.all.select { |test| test.student == self }
    end

    def all_instructors
        tests.map { |test| test.instructor }.uniq
    end

    def grade_percentage
        passed_tests = tests.select { |test| test.status == "passed" }
        (passed_tests.length / tests.length.to_f * 100).round(2)
    end
end
