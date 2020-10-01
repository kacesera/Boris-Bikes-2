require_relative 'bike'

class DockingStation
  
  DEFAULT_CAPACITY = 20
  attr_accessor :bike_rack

  def initialize
    @bike_rack = []
    DEFAULT_CAPACITY.times {bike_rack << Bike.new}
  end

  def release_bike
    raise "There are no bikes available."if !self.has_bikes?
    bike_rack.pop
  end

  def dock(bike)
    raise "There isn't room for your bike." if self.is_full?
    bike_rack << bike
    "Bike is docked"
  end

  private

  def is_full?
    bike_rack.count == DEFAULT_CAPACITY
  end

  def has_bikes?
    bike_rack.count >= 1
  end

end
