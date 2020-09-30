require 'docking_station'

describe DockingStation do

    it "responds to request to release bike" do
        station = DockingStation.new
        expect(station.release_bike).to exist
    end
end
