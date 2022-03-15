require_relative './spec_helper'

describe Genre do
  before :each do
    @genre = Genre.new('Jazz')
    @item = Item.new('2010-01-01')
  end

  describe '#new' do
    it 'should create a new genre' do
      expect(@genre).to be_instance_of(Genre)
    end

    it 'should raise an error if not enough arguments are passed' do
      expect { Genre.new }.to raise_error ArgumentError
    end
  end

  describe '#add_item' do
    it 'should add an item' do
      @genre.add_item(@item)
      expect(@genre.items.length).to eq(1)
    end

    it "shouldn't add an item !instance_of Item" do
      @genre.add_item('Rock')
      expect(@genre.items.length).to eq(0)
    end

    it "shouldn't add the same item twice" do
      @genre.add_item(@item)
      @genre.add_item(@item)
      expect(@genre.items.length).to eq(1)
    end
  end
end
