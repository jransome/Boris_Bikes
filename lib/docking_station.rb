require './lib/bike'

class DockingStation
  attr_reader :docked_bikes

  def release_bike
    if @docked_bikes == nil
      fail("Sorry, no bikes available")
    else
      @docked_bikes
    end
  end

  def dock_bike bike
    @docked_bikes = bike
  end

end
