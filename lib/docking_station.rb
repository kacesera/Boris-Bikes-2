require_relative 'bike'

class DockingStation

  def release_bike
    Bike.new
  end

  def dock(bike)
    "Bike is docked"
  end
  
end
