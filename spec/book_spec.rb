require 'rspec'
require_relative '../Classes/book'

describe Book do
  before :each do
    @book = Book.new('publisher', 'cover_state', '2020/2/3')
  end

  describe '#new' do
    it 'should create a new book' do
      expect(@book).to be_instance_of(Book)
    end
    it 'should throw an error without three arguments' do
      expect { Book.new('Publisher', 'CoverState') }.to raise_error(ArgumentError)
    end
    it 'should have all properties' do
      expect(@book.cover_state).to eq('cover_state')
      expect(@book.publisher).to eq('publisher')
    end
    it 'should have cover_state settable' do
      @book.cover_state = 'good'
      expect(@book.cover_state).to eq('good')
    end
    it 'should not have publisher settable' do
      expect { @book.publisher = 'new_guy' }.to raise_error NameError
    end
  end

  describe '#can_be_archived?' do
    it 'should return true if date is earlier than 10 years' do
      book = Book.new('publisher', 'cover_state', '2010/2/3')
      expect(book.can_be_archived?).to be_truthy
    end
    it 'should return true if cover_state is bad' do
      book = Book.new('publisher', 'bad', '2020/2/3')
      expect(book.can_be_archived?).to be_truthy
    end
    it 'should return false if cover_state is not bad and date is not earlier than 10 years' do
      book = Book.new('publisher', 'good', '2020/2/3')
      expect(book.can_be_archived?).to be_falsy
    end
  end
end
