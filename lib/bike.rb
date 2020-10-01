class Bike
  
  attr_reader :working

  def initialize
    @working = "Y"
  end

  def working?(status = @working)
    return false if status == "N"
    true
  end

end
