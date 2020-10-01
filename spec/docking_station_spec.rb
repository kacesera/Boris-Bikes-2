require 'docking_station'
require 'bike'

describe DockingStation do

  before(:each) do 
    @station = DockingStation.new
    @bike = Bike.new
  end

  it {is_expected.to respond_to(:release_bike)}

  it 'releases working bikes' do
    expect(@bike).to be_working
  end

  it 'docks bikes' do
    @station.release_bike
    expect(@station.dock(@bike)).to eq("Bike is docked")
  end

  it 'shows docked bikes' do
    @station.bike_rack << @bike
    expect(@station.bike_rack).to include(@bike)
  end

  it "does not release bikes, when none are available" do
    @station.release_bike
    expect{@station.release_bike}.to raise_error("There are no bikes available.")
  end

  it "does not dock bikes if it is full" do 
    expect{@station.dock(@bike)}.to raise_error("There isn't room for your bike.")
  end
end
