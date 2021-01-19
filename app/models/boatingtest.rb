class BoatingTest

    @@all = []

    def self.all
        @@all
    end

    attr_accessor :student, :instructor, :test_name, :status

    def initialize(student, instructor, test_name, status)
        @student, @instructor, @test_name, @status = student, instructor, test_name, status
        save
    end

    def save
        self.class.all << self
    end
end
