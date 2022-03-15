require_relative './spec_helper'

describe Musicalbum do
  before :each do
    @musicalbum = Musicalbum.new('2010-01-01', on_spotify: true)
    @musicalbumtwo = Musicalbum.new('2010-01-01', on_spotify: false)
    @musicalbumthree = Musicalbum.new('2021-01-01', on_spotify: true)
  end

  describe '#new' do
    it 'should create a new Music album' do
      expect(@musicalbum).to be_instance_of(Musicalbum)
    end

    it 'should raise an error if not enough arguments are passed' do
      expect { Musicalbum.new }.to raise_error ArgumentError
    end
  end

  describe '#can_be_archived?' do
    it 'should return true if both conditions are met' do
      expect(@musicalbum.can_be_archived?).to be_truthy
    end

    it 'should return false if !on_spotify' do
      expect(@musicalbumtwo.can_be_archived?).to be_falsy
    end

    it 'should return false if !can_be_archived?' do
      expect(@musicalbumthree.can_be_archived?).to be_falsy
    end
  end
end
