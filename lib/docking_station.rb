require './lib/bike'

class DockingStation
  attr_reader :docked_bikes

  def release_bike
    Bike.new
  end

  def dock_bike bike
    @docked_bikes = bike
  end

end
