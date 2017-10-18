require('pg')
require_relative('../db/sql_runner.rb')



class Student

attr_reader :id
attr_accessor :first_name, :second_name, :house, :age

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @second_name = options['second_name']
    @house = options['house']
    @age = options['age'].to_i
  end

    def save()
      sql = "INSERT INTO students (first_name, second_name, house, age)
      VALUES ($1, $2, $3, $4) RETURNING *"
      values = [@first_name, @second_name, @house, @age]
      returned_array = SqlRunner.run(sql, values)
      student_hash = returned_array[0]
      id_string = student_hash['id']
      @id = id_string.to_i
    end

    def self.all()
      sql = "SELECT * FROM students"
      values = []
      student_hashes = SqlRunner.run(sql, values)
      student_objects = student_hashes.map{|student| Student.new(student)}
      return student_objects
    end

    def self.delete_all()
      db = PG.connect({ dbname: 'hogwarts', host: 'localhost'})
      sql = "DELETE FROM students"
      values = []
      db.prepare("delete_all", sql)
      db.exec_prepared("delete_all", values)
      db.close
    end

    def delete
      db = PG.connect({ dbname: 'hogwarts', host: 'localhost'})
      sql = "DELETE FROM students WHERE id = $1"
      values=[@id]
      db.prepare("delete_one", sql)
      db.exec_prepared("delete_one", values)
      db.close
    end

    def update
      db = PG.connect({ dbname: 'hogwarts', host: 'localhost'})
      sql = "UPDATE students SET (first_name, second_name, house, age)
       = ($1, $2, $3, $4 ) WHERE id = $5"
       values = [@first_name, @second_name, @house, @age, @id]
       db.prepare("update", sql)
       db.exec_prepared("update", values)
       db.close
    end

    def self.find(id)
      sql = "SELECT * FROM students WHERE id = $1"
      values = [id]
      results = SqlRunner.run(sql,values)
      student_hash = results.first
      student = Student.new(student_hash)
      return student
    end


end
