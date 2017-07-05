require './lib/bike'

class DockingStation
  attr_reader :bike

  def release_bike
    if @bike == nil
      fail("Sorry, no bikes available")
    else
      @bike
    end
  end

  def dock bike
    fail("No capacity available to dock bike!") if @bike != nil
    @bike = bike
  end

end
