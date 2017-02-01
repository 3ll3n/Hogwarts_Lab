require_relative("../db/sql_runner")

class Student

  attr_accessor :id, :first_name, :second_name, :house_id, :age

  def initialize(options)
    @id = options["id"].to_i
    @first_name = options["first_name"]
    @second_name = options["second_name"]
    @house_id = options["house_id"].to_i
    @age = options["age"].to_i
  end

  def save()
    sql = "INSERT INTO students (first_name, second_name, house_id, age) VALUES ('#{@first_name}', '#{@second_name}', #{@house_id}, #{@age}) RETURNING *"
    student = SqlRunner.run(sql)
    @id = student.first()['id'].to_i 
  end

  def self.all()
    sql = "SELECT * FROM students"
    result = SqlRunner.run(sql)
    # returns an array of student hashes
    return result.map{ |student_hash| Student.new(student_hash) }
  end

  def self.find(id)   
    sql = "SELECT * FROM students WHERE id = #{id}"
    student = SqlRunner.run(sql)
    result = Student.new(student.first)

    return result
  end

  def find_house()
    sql = "SELECT * FROM houses WHERE id = #{@house_id}"
    house_data = SqlRunner.run(sql).first
    result = House.new(house_data)

    return result
  end

end