

class Player
  attr_reader :name, :hp

  def initialize(name)
    @name = name
    @hp = 100
  end

  def receive_damage
    @hp -= rand(30)
    message
  end

  def message
    "#{@name} died" if @hp <= 0
  end

end
