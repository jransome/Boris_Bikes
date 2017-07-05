require 'pry'
require './lib/bike'

class DockingStation
  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def release_bike
    fail("Sorry, no bikes available") if empty?
    @bikes.pop
  end

  def dock bike
    fail("No capacity available to dock bike!") if full?
    @bikes << bike
  end

  private

  def empty?
    return @bikes.empty?
  end

  def full?
    return @bikes.length >= 20 ? true : false
  end
end
