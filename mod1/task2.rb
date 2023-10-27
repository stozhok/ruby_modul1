#varian - 10
require 'test-unit'
require 'time'

class Train
  attr_accessor :destination, :train_number, :departure_time
  attr_reader :total_seats, :compartment_seats, :second_class_seats, :luxury_seats

  def initialize(destination, train_number = rand, departure_time = "00:00", total_seats = rand, compartment_seats = rand, second_class_seats = rand, luxury_seats = rand)
    @destination = destination
    @train_number = train_number
    @departure_time = departure_time
    @total_seats = total_seats
    @compartment_seats = compartment_seats
    @second_class_seats = second_class_seats
    @luxury_seats = luxury_seats
  end
  def to_s
    "Train ##{train_number} to #{destination} departing at #{departure_time.strftime("%H:%M")}"
    end
  def self.task1(trains,destination)
    trains.select {|train| train.destination == destination}
  end
  def self.task2(trains, destination, time)
    trains.select {|train|train.destination == destination && train.departure_time > time}
  end
  def self.task3(trains,destination)
    trains.select{|train| train.destination == destination && train.total_seats > 0}
  end
end

# trains = [
#   Train.new("Kyiv", 223, Time.parse("09:36"),200,45,125,30),
#   Train.new("Kharkiv",125,Time.parse("10:22"),150,30,100,20),
#   Train.new("Lviv",278,Time.parse("22:00"),150,100,35,15),
#   Train.new("Sumy",879,Time.parse("05:20"),70,15,55,10)
# ]
class TestTrain < Test::Unit::TestCase
  def setup
    @trains = [
      Train.new("Kyiv", 223, Time.parse("09:36"), 200, 45, 125, 30),
      Train.new("Kharkiv", 125, Time.parse("10:22"), 150, 30, 100, 20),
      Train.new("Lviv", 278, Time.parse("22:00"), 150, 100, 35, 15),
      Train.new("Sumy", 879, Time.parse("05:20"), 70, 15, 55, 10)
    ]
  end

  def test_task1
    destination = "Kyiv"
    result = Train.task1(@trains, destination)
    assert_equal(1, result.length)
    assert_equal("Kyiv", result[0].destination)
  end

  def test_task2
    destination = "Kyiv"
    time = Time.parse("09:00")
    result = Train.task2(@trains, destination, time)
    assert_equal(1, result.length)
    assert_equal("Kyiv", result[0].destination)
  end

  def test_task3
    destination = "Kyiv"
    result = Train.task3(@trains, destination)
    assert_equal(1, result.length)
    assert_equal("Kyiv", result[0].destination)
    assert(result[0].total_seats > 0)
  end
end