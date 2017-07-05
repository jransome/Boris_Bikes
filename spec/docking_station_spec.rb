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
    expect(station.bike).to eq(bike)
  end

  it 'responds to a docking method' do
    expect(station).to respond_to(:dock).with(1).argument
  end

  it 'responds to .bike method' do
    expect(station).to respond_to(:bike)
  end

  it 'raises Error when there are no bikes' do
    expect {station.release_bike}.to raise_error("Sorry, no bikes available")
  end

  it 'raises an error when docking more than one bike at the station' do
    bike = Bike.new
    station.dock(bike)
    bike2 = Bike.new
    expect {station.dock(bike2)}.to raise_error("No capacity available to dock bike!")
  end

end
