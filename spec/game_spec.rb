require_relative '../Classes/game'


describe Game do
  before :all do
    @game1 = Game.new('2010-04-05', true, '2015-11-07')
    @game2 = Game.new('2020-01-02', true, '2020-03-12')
  end

  describe '#new' do
    it 'should create a new game' do
      expect(@game1).to be_instance_of(Game)
    end

    it 'should have all the properties' do
      expect(@game1.publish_date).to eq('2010-04-05')
      expect(@game1.multiplayer).to be_truthy
      expect(@game1.last_played_at).to eq('2015-11-07')
    end
  end

  describe '#can_be_archived?' do
    it 'should have an archived that depends on both the publish date and the last played at' do
      expect(@game1.can_be_archived?).to be_truthy
    end

    it 'should return false if either publish date is less than 10 years or last played at is less than 2 years' do
      expect(@game2.can_be_archived?).to be_falsy
    end
  end
end
