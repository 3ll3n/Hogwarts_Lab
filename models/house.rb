require_relative("../db/sql_runner")

class House

  attr_accessor :id, :name

  def initialize(options)
    @id = options["id"].to_i
    @name = options["name"]
  end


  def save()
    sql = "INSERT INTO houses (name) VALUES ('#{@name}') RETURNING *"
      house = SqlRunner.run(sql)
      @id = house.first()['id'].to_i 
  end

  def self.all()
    sql = "SELECT * FROM houses"
    result = SqlRunner.run(sql)
    return result.map{ |house| House.new(house) }
  end

  def self.find(id)
    sql = "SELECT * FROM houses WHERE id = #{id}"
    house = SqlRunner.run(sql)
    result = House.new(house.first)

    return result
  end


  end
