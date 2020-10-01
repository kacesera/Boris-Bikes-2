class Bike
  
  attr_reader :working

  def initialize(working = "Y")
    @working = working 
  end

  def working?(status = @working)
    @working = status
    return false if @working == "N"
    true
  end

end
