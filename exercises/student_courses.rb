class Student

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name = last_name
    @courses = []
  end

  def name
    @first_name + @last_name
  end

  def courses
    @courses
  end

  def enroll(course)
    @courses.each do |listed_course|
      if listed_course.conflicts_with?(course)
        raise "Time Conflict"
      end
    end
    course.add_student(self)
    @courses.push(course) unless @courses.include?(course)
  end

  def course_load
    course_load_hash = {}
    @courses.each do |course|
      course_load_hash[course.department] = course.credits
    end
    course_load_hash
  end

end

class Course

  def initialize(name, department, credits, days, time)
    @name = name
    @department = department
    @credits = credits
    @students = []
    @days = days
    @time = time
  end

  def days
    @days
  end

  def time
    @time
  end

  def conflicts_with?(second_course)
    @days.each do |day|
      if second_course.days.include?(day)
        if second_course.time == time
          return true
        end
      end
    end
    false
  end

  def add_student(student)
    @students.push(student) unless @students.include?(student)
  end

  def department
    @department
  end

  def credits
    @credits
  end

  def students
    @students
  end

end