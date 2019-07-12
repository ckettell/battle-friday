require_relative './player'

class Game

attr_reader :player_1, :player_2, :current_turn

  def initialize(player_1, player_2)
    @players = [player_1, player_2]
    @current_turn = player_1
  end

  def self.create(player_1, player_2)
    @game = Game.new(player_1, player_2)
  end

  def self.instance
    @game
  end

  def player_1
    @players.first
  end

  def player_2
    @players.last
  end

  def switch_turns
    @current_turn = opponent_of(current_turn)
  end

  def attack(player)
    player.receive_damage
  end

  private

  def opponent_of(the_player)
    @players.select { |player| player != the_player }.first
  end

end
