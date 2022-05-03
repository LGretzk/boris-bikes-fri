require_relative 'bike'

class DockingStation

  CAPACITY = 20

  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def release_bike
    fail 'No bikes available' if empty? 
    fail 'No bikes available' if @bikes.first.broken?
    @bikes.pop 
  end

  def dock(bike)
    fail 'Docking station full' if full?
    @bikes << bike
  end

  private

  def full?
    @bikes.length >= CAPACITY
  end

  def empty?
    @bikes.empty?
  end

end