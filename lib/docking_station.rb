require_relative './bike.rb'

class DockingStation
  
  DEFAULT_CAPACITY = 20
  attr_reader :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
  end

  def release_bike
    raise 'No bikes available' if bikes.empty?
    bikes.pop
  end

  def dock(bike)
    raise 'Docking station is full' if full?
    bikes << bike
  end

  private

  # this means these methods can not be called on DockingStation
  attr_reader :bikes

  def full?
    bikes.count >= DEFAULT_CAPACITY
  end

  def empty?
    bikes.empty?
  end
end
