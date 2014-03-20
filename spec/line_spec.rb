require 'spec_helper'

describe Line do
  describe 'initialize' do
    it 'initializes the line with a name' do
      test_line = Line.new('green')
      test_line.should be_an_instance_of Line
    end
    it 'starts off with no lines' do
      Line.all.should eq []
    end
  end

  describe '#save' do
    it 'saves an instance of a new line' do
      test_line = Line.new('red')
      test_line.save
      test_line.id.should be_an_instance_of Fixnum
    end
  end

  describe '.create' do
    it 'creates a new instance of Line' do
      test_line = Line.create('yellow')
      test_line.id.should be_an_instance_of Fixnum
    end
  end

  describe '==(another_line)' do
    it 'is the same line if it has the same name' do
      test_line1 = Line.new('red')
      test_line2 = Line.new('red')
      test_line1.should eq test_line2
    end
  end

  describe 'line_exists?' do
    it 'tells you if the line has already been created' do
      test_line = Line.create('blueish')
      Line.all[0].line_exists?('blueish').should eq true
    end
  end
end









