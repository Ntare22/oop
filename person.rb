require './corrector'

class Person
  attr_accessor :name, :age
  attr_reader :id, :rentals

  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = Random.rand(1..1000)
    @name = name
    @parent_permission = parent_permission
    @age = age
    @rentals = []
    @capitalize_name = Corrector.new
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def validate_name
    @name = capitalize_name.correct_name(@name)
  end

  private

  def of_age?
    @age >= 18
  end
end
