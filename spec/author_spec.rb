require_relative '../Classes/author'

describe Author do
  before :each do
    @author = Author.new('Shigeru', 'Miyamoto')
    @item = Item.new('2020-3-4')
  end

  describe '#new' do
    it 'should create a new author' do
      expect(@author).to be_instance_of(Author)
    end
  end

  describe '#add_item' do
    it 'should add an item to the author' do
      expect(@author.items.length).to be(0)
      @author.add_item(@item)
      expect(@author.items[0]).to be(@item)
    end

    it 'should add the item only once' do
      @author.add_item(@item)
      @author.add_item(@item)
      expect(@author.items.length).to eq(1)
    end

    it 'should add the author to the item' do
      @author.add_item(@item)
      expect(@item.author).to be(@author)
    end

    it 'should not add an item if the item is not of class Item' do
      @author.add_item('item')
      expect(@author.items.length).to eq(0)
    end
  end
end