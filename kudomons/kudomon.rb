class Kudomon
  attr_reader :name, :xPos, :yPos #classes inheriting Kudomon have access to these

  def initialize(n, x, y)
    @name, @xPos, @yPos = n, x, y
    puts "#{name}, #{xPos}, #{yPos}"
  end

  protected :name, :xPos, :yPos
end


