require_relative 'bike'

class DockingStation
  
  DEFAULT_CAPACITY = 20
  attr_accessor :bike_rack, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @bike_rack = []
    capacity.times {bike_rack << Bike.new}
  end

  def release_bike
    raise "There are no bikes available." if !self.has_bikes?

    bike_rack.each do |bike|
      if bike.working?
        return bike_rack.delete(bike)
      end
    end 

    raise "all bikes broken" 
  end

  def dock(bike)
    raise "There isn't room for your bike." if self.is_full?

    set_status(bike)

    bike_rack << bike
    "Bike is docked"
  end

  private

  def is_full?
    bike_rack.count == capacity
  end

  def has_bikes?
    bike_rack.count >= 1
  end

  def set_status(bike)
    puts "Is the bike working? Type Y or N"
    bike.working?(gets.chomp.upcase)
  end
end
