require 'docking_station'
require 'bike'

describe DockingStation do

  before(:each) do 
    @station = DockingStation.new
    @bike = subject.release_bike
  end

  it {is_expected.to respond_to(:release_bike)}

  it 'releases working bikes' do
    expect(@bike).to be_working
  end

  it 'docks bikes' do
    expect(@station.dock(@bike)).to eq("Bike is docked")
  end

  it 'shows bikes' do
    expect(@station.bike_rack).not_to be_empty
  end

end
