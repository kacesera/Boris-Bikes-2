require_relative 'bike'

class DockingStation

  attr_accessor :bike_rack

  def initialize
    @bike_rack = []
    20.times {bike_rack << Bike.new}
  end

  def release_bike
    if !bike_rack.empty?
      return bike_rack.pop
    else
      raise "There are no bikes available."
    end
  end

  def dock(bike)
    if bike_rack.size < 20
      bike_rack << bike
      "Bike is docked"
    else
      raise "There isn't room for your bike."
    end
  end

  

end
