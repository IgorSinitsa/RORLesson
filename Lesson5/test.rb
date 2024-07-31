class Test
  require_relative "validation"
  require_relative "error"

  include Validation
  validate :name, :presence
  # validate :name, :format, /^[a-z\d]{3}-?[a-z\d]{2}$/
  validate :name, :type, String
  validate :name, :length, 10

  def work
    puts "sssssss"
  end

  def initialize(name)
    # puts @_var_validate
    @name = name
    validate!
  end

  #   puts @@_var_validate
  #   puts "-------------------------------"
  #   # puts instans_variable_get("@@_var_validate")
  #   puts "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
  #   # puts " yes" if self.methods?("@name=")

  # end
  # puts "dhf-xx".inspect
  n = Test.new("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx")
  n.name = "dhf-xx"
end
