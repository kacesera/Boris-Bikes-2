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
    @station.bike_rack = []
    expect{@station.release_bike}.to raise_error("There are no bikes available.")
  end

  it "does not dock bikes if it is full" do 
    expect{@station.dock(@bike)}.to raise_error("There isn't room for your bike.")
  end

  it "has space for 20 bikes as default" do
    expect(@station.bike_rack.size).to eq(DockingStation::DEFAULT_CAPACITY)
  end

  it "can have different capacity" do
    new_ds = DockingStation.new(30)
    expect(new_ds.bike_rack.size).to eq(30)
  end
  
  it "ask if bike is working when returned to docking station" do
    @station.release_bike
    expect{@station.dock(@bike)}.to output("Is the bike working? Type Y or N\n").to_stdout
  end

  it "doesn't release broken bikes" do
    @station.bike_rack = []
    @station.dock(@bike)
    expect{@station.release_bike}.to raise_error("all bikes broken")
  end
end
