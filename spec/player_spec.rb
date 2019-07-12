require 'player'

describe Player do

  let(:leo) { described_class.new('Leo')}
  let(:charlie) { described_class.new('Charlie')}

    it 'returns the name of the player' do
    expect(leo.name).to eq 'Leo'
  end

    it 'returns HP of the player' do
      expect(leo.hp).to eq 100
    end
    # 
    # describe '#receive_damage' do
    #   it 'will minus by 10 points from hp' do
    #     expect {leo.receive_damage}.to change {leo.hp}.by(receive_damage)
    #   end
    # end

    describe '#message' do
      it 'will inform a user has died' do
        9.times { leo.receive_damage }
        expect(leo.receive_damage).to eq "Leo died"
      end
    end
end
