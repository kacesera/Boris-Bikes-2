require 'docking_station'
require 'bike'

describe DockingStation do

    it {is_expected.to respond_to(:release_bike)}
    
    it "creates a new bike" do
        station = DockingStation.new 
        bike = station.release_bike
        expect(bike).to be_instance_of(Bike)
    end

end
