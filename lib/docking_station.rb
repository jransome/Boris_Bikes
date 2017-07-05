require 'pry'
require './lib/bike'

class DockingStation
  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def release_bike
    if @bikes.length == 0
      fail("Sorry, no bikes available")
    else
      @bikes.last
    end
  end

  def dock bike
    fail("No capacity available to dock bike!") if @bikes.length >= 20
    @bikes << bike
  end

end
