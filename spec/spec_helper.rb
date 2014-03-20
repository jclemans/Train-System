require 'rspec'
require 'station'
require 'line'
require 'pg'

DB = PG.connect({:dbname => 'test_train_system'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM stations *;")
    DB.exec("DELETE FROM lines *;")
  end
end
