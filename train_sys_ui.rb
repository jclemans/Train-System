require 'pg'
require './lib/station'
require './lib/line'

DB = PG.connect({:dbname => 'train_system'})

puts "\nWelcome to the TRAIN SYSTEM MANAGER!"

def operator_menu
  puts "----------------------------------------"
  puts "Enter 'AL' to create a new line"
  puts "Enter 'AS' to add a new station."

  puts "Enter 'VL' to view all existing lines"
  puts "Enter 'VS' to view all existing stations."

  puts "Use 'X' to exit program."
  puts "----------------------------------------"
  operator_choice = gets.chomp.upcase
  case operator_choice
  when 'AS'
    add_station
  when 'VS'
    view_stations
  when 'AL'
    add_line
  when 'VL'
    view_lines
  when 'X'
    exit
  else
    puts "I don't understand that command. Please enter a new command."
    operator_menu
  end
end

def add_station
  puts "Enter the name of the new station"
  station_input = gets.chomp.capitalize
  new_station = Station.create(station_input)
  puts "\n#{new_station.name} has been added to the system"
  puts "Please enter the line color for the route this station is on:"
  color_input = gets.chomp
  if Line.all.exists?(color_input)
  else
    puts "That line does not exist. Please create a new line first."
  operator_menu
end

def view_stations
  list_of_stations = []
  Station.all.each_with_index do |station, index|
    station_name = station.name
    list_of_stations << "#{index + 1}. #{station_name}"
  end
  puts "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n**Station List**:\n\n"
  puts list_of_stations
  puts "----------------------"
  station_menu
end

def add_line
  puts "Enter the color of the new line"
  input = gets.chomp.capitalize
  new_line = Line.create(input)
  puts "\n#{new_line.color} has been added to the system"
  operator_menu
end

def view_lines
  list_of_lines = []
  Line.all.each_with_index do |line, index|
    line_color = line.color
    list_of_lines << "#{index + 1}. #{line_color}"
  end
  puts "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n**Line List**:\n\n"
  puts list_of_lines
  puts "----------------------"
  operator_menu
end

def station_menu
  puts "Enter the number of the station to see all connecting lines:"
  puts "Or enter 'M' to return to the main menu."
  station_choice = gets.chomp
  if station_choice == 'M'
    operator_menu
  elsif station_choice.match(/\d/) && station_choice.to_i <= Station.all.length
      #check line below after populating join table
    station_lines = DB.exec("SELECT * FROM stops WHERE station_id = #{station_choice.to_i -1};")
    puts station_lines
  else
    puts "invalid entry"
    station_menu
  end
end

operator_menu





