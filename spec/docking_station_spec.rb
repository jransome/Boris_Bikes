require 'docking_station'
describe DockingStation do
  subject(:station) {DockingStation.new}
  it { is_expected.to respond_to(:release_bike)}

  it 'returns an instance of Bike when released_bike is called and that the bike is working' do
    expect(subject.release_bike).to be_an_instance_of(Bike)
    expect(Bike.new.working?).to eq(true)
  end

  it 'docks a bike at the station and shows bikes currently docked there' do
    bike = Bike.new
    station.dock_bike(bike)
    expect(station.docked_bikes).to eq(bike)
  end

  it 'responds to a docking method' do
    expect(station).to respond_to(:dock_bike).with(1).argument
  end

  it 'responds to .docked_bikes method' do
    expect(station).to respond_to(:docked_bikes)
  end

end
