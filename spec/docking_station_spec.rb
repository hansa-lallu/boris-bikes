require 'docking_station'

describe DockingStation do
  it 'responds to release_bike' do
    expect(subject).to respond_to :release_bike
  end

  it { is_expected.to respond_to(:dock).with(1).argument }

  # it { is_expected.to respond_to(:bike) } - no longer required as the bike method has been removed
  it 'docks the bike' do
    bike = Bike.new
    expect(subject.dock(bike)).to eq [bike]
  end

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

    it 'does not release a bike when broken' do
      bike = Bike.new()
      bike.report_broken()
      subject.dock(bike);

      expect { subject.release_bike }.to raise_error 'No bikes available'
    end 
  end

  describe 'dock' do
    it 'raises an error when full' do
      subject.capacity.times { subject.dock :bike }
      expect { subject.dock double(:bike) }.to raise_error 'Docking station is full'
    end
  end

  describe 'initialization' do
    subject { DockingStation.new }
      let(:bike) { Bike.new }
    it 'defaults capacity' do
      described_class::DEFAULT_CAPACITY.times do 
        subject.dock(bike)
      end
      expect { subject.dock(bike) }.to raise_error 'Docking station is full'
    end
  end
end