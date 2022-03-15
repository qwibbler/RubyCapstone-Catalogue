require 'rspec'
require_relative '../Classes/label'

describe Label do
  before :each do
    @label = Label.new('title', 'color')
    @item = Item.new('2020-3-4')
  end

  describe '#new' do
    it 'should create a new label' do
      expect(@label).to be_instance_of(Label)
    end
  end

  describe '#add_item' do
    it 'should add an item to the label' do
      @label.add_item(@item)
      expect(@label.items[0]).to be(@item)
    end
    it 'should add the item only once' do
      @label.add_item(@item)
      @label.add_item(@item)
      expect(@label.items.length).to eq(1)
    end
    it 'should add the label to the item' do
      @label.add_item(@item)
      expect(@item.label).to be(@label)
    end
    it 'should not add an item if the item is not of class Item' do
      @label.add_item('item')
      expect(@label.items.length).to eq(0)
    end
  end
end
