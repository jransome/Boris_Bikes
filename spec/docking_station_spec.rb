require 'docking_station'
describe DockingStation do
  subject(:station) {DockingStation.new}
  it { is_expected.to respond_to(:release_bike)}

  it 'returns a bike when the station has one and that this bike is working' do
      bike = Bike.new
      station.dock(bike)
      expect(subject.release_bike).to be_an_instance_of(Bike)
      expect(subject.release_bike.working?).to eq(true)
  end

  it 'docks a bike at the station and shows bikes currently docked there' do
    bike = Bike.new
    station.dock(bike)
    expect(station.bikes).to include(bike)
  end

  it 'responds to a docking method' do
    expect(station).to respond_to(:dock).with(1).argument
  end

  it 'responds to .bikes method' do
    expect(station).to respond_to(:bikes)
  end

  it 'raises Error when there are no bikes' do
    expect {station.release_bike}.to raise_error("Sorry, no bikes available")
  end

  it 'raises an error when docking more than 20 bikes at the station' do
    20.times { station.dock Bike.new }
    expect {station.dock(Bike.new)}.to raise_error("No capacity available to dock bike!")
  end

end
