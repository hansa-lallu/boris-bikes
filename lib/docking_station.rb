require_relative './bike.rb'

class DockingStation
  
  DEFAULT_CAPACITY = 20

  attr_reader :bikes, :capacity

  def initialize(capacity=DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    raise 'No bikes available' if bikes.empty?
    released_bike = bikes.pop()
    raise 'Can not release, bike broken' if released_bike.working == false
    
    released_bike
  end

  def dock(bike)
    fail "Docking station is full" if full?
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
