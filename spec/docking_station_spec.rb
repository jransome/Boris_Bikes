require 'docking_station'
describe DockingStation do
  subject {DockingStation.new}
  it { is_expected.to respond_to(:release_bike)} 
end
