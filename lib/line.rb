class Line

  attr_reader :color, :id
  require 'pry'

  def initialize(color)
    @color = color
  end

  def self.create(color)
    new_line = Line.new(color)
    new_line.save
    return new_line
  end

  def self.all
    line_query = DB.exec("SELECT * FROM lines;")
    @all_lines = []
    line_query.each do |line|
      color = line['color']
      @all_lines << Line.new(color)
    end
    @all_lines
  end

  def save
    line = DB.exec("INSERT INTO lines (color) VALUES ('#{@color}') RETURNING id;")
    @id = line.first['id'].to_i
  end

  def ==(another_line)
    self.color == another_line.color
  end

  def line_exists?(input_color)
    match = false
    Line.all.each do |line|
      if line.color == input_color
        match = true
      end
    end
    return match
  end
end






