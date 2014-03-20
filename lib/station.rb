class Station
  attr_reader :name, :id
  require 'pry'

  def initialize(name)
    @name = name
  end

  def self.all
    all_stations = DB.exec("SELECT * FROM stations;")
    @stations = []
    all_stations.each do |station|
      name = station['name']
      @stations << Station.new(name)
    end
    @stations
  end

  def save
    instance = DB.exec("INSERT INTO stations (name) VALUES ('#{@name}') RETURNING id;")
    @id = instance.first['id'].to_i
  end

  def self.create(name)
    new_station = Station.new(name)
    new_station.save
    return new_station
  end

  def join_line
  end

  def ==(another_station)
    self.name == another_station.name
  end
end








