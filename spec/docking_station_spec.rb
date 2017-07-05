require 'docking_station'
describe DockingStation do
  subject(:station) {DockingStation.new}
  it { is_expected.to respond_to(:release_bike)}

  it 'returns a bike when the station has one' do
    bike = Bike.new
    station.dock(bike,bike.working?)
    expect(subject.release_bike).to be_an_instance_of(Bike)
  end

  it 'shows the working status of bikes released from the station' do
    bike = Bike.new
    station.dock(bike, bike.working?)
    expect(subject.release_bike.working?).to eq(true)
  end

  it 'docks a bike at the station and shows bikes currently docked there' do
    bike = Bike.new
    station.dock(bike, bike.working?)
    expect(station.bikes).to include(bike)
  end

  it 'responds to a docking method' do
    expect(station).to respond_to(:dock).with(2).argument
  end

  it 'responds to .bikes method' do
    expect(station).to respond_to(:bikes)
  end

  it 'raises Error when there are no bikes' do
    expect {station.release_bike}.to raise_error("Sorry, no bikes available")
  end

  it 'raises an error when docking more than 20 bikes at the station' do
    bike = Bike.new
    DockingStation::DEFAULT_CAPACITY.times { station.dock(bike, bike.working?) }
    expect {station.dock(bike, bike.working?)}.to raise_error("No capacity available to dock bike!")
  end

  it 'has a default capacity' do
    expect(station.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end

  it 'has a definable capacity' do
    bike = Bike.new
    custom_capacity = 132
    ds = DockingStation.new(custom_capacity)
    custom_capacity.times do
      ds.dock(bike, bike.working?)
    end
    expect {ds.dock(bike, bike.working?)}.to raise_error("No capacity available to dock bike!")
  end

end
