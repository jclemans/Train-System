require 'spec_helper'

describe Station do

  describe '#initialize' do
    it 'is initialized with a name' do
      test_station = Station.new('Alberta')
      test_station.should be_an_instance_of Station
    end
    it 'starts off with no stations' do
      Station.all.should eq []
    end
  end

  describe '#save' do
    it 'saves a new station to the stations table in the database' do
      test_station = Station.new('Butch')
      test_station.save
      test_station.id.should be_an_instance_of Fixnum
    end
  end

  describe '.create' do
    it 'creates and saves a new station' do
      test_station = Station.create('Innsbruck')
      test_station.id.should be_an_instance_of Fixnum
    end
  end

  describe '==(another_station)' do
    it 'is is the same station if it has the same station name' do
      test_station1 = Station.new('Conroe')
      test_station2 = Station.new('Conroe')
    end
  end


  # describe 'join_line' do
  #   it 'associates a line to the station' do
  #     test_station = Station.create('Darby')
  #     test_line = Line.create('Blue')
  #     test_station.join_line(test_line).should be_an_instance_of Fixnum

  # describe 'find_lines' do
  #   it 'lists all lines associated with the inputted station' do

end
