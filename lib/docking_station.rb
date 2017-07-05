require 'pry'
require './lib/bike'

class DockingStation
  attr_reader :bikes
  DEFAULT_CAPACITY = 20

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
    return @bikes.length >= DEFAULT_CAPACITY ? true : false
  end
end
