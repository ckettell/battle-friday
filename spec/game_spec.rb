require 'game'

describe Game do
  # let(:charlie) { double :player, hp: 100 }
  # let(:leo) { double :player, hp: 100}


let(:player_1) { double :player }
let(:player_2) { double :player }
subject(:game) { described_class.new(player_1, player_2) }

  describe '#attack' do
    it 'implements receive damage' do
      expect(player_2).to receive(:receive_damage)
      game.attack(player_2)
    end
  end

  describe '#current_turn' do
    it 'starts on player one' do
      expect(game.current_turn).to eq player_1
    end
  end

  describe '#switch_turns' do
    it 'switches turns' do
      game.switch_turns
      expect(game.current_turn).to eq player_2
    end
  end
end
