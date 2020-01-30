require 'docking_station'

describe DockingStation do
  it 'responds to release_bike' do
    expect(subject). to respond_to :release_bike
  end
  # above - checks if method exists and is responding to the class
  # one liner syntax :  it { is_expected.to respond_to :release_bike }
  it 'releases a new bike if bike is working' do
    bike = Bike.new
    expect(bike).to be_working
  end

  it { is_expected.to respond_to(:dock).with(1).argument }

  # it { is_expected.to respond_to(:bike) } - no longer required as the bike method has been removed
  it 'docks the bike' do
    bike = Bike.new
    expect(subject.dock(bike)).to eq [bike]
  end

  # deleted below test as it is the same as above
  # it 'returns docked bikes' do
  #   bike = Bike.new
  #   expect(subject.dock(bike)).to eq [bike]
  # end

  it 'has a deafault capacity' do
    expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end

  # using a # below to imply that is it an instance method
  describe '#release_bike' do
    it 'releases a bike' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end

    it 'raises an error when there are no bikes available' do
      DockingStation::DEFAULT_CAPACITY.times { subject.dock Bike.new }
      DockingStation::DEFAULT_CAPACITY.times { subject.release_bike }
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end

    # it 'does not release a bike when broken' do

    #   expect(subject.release_bike)
      
    # end 
    # end
  end

  describe 'dock' do
    it 'raises an error when full' do
      subject.capacity.times { subject.dock Bike.new }
      expect { subject.dock Bike.new }.to raise_error 'Docking station is full'
    end
  end

  describe 'initialization' do
    subject { DockingStation.new }
      let(:bike) { Bike.new }
    it 'defaults capacity' do
      described_class::DEFAULT_CAPACITY.times {subject.dock(bike)} 
      expect { subject.dock(bike) }.to raise_error 'Docking station is full'
    end
  end
end