require 'docking_station'

describe DockingStation do

  let(:bike) { double('Bike') }
    
  it 'initializes with bikes array' do
    expect(subject.bikes).to eq []
  end

  # it 'responds to responds to release_bike' do
  #     expect(DockingStation.new).to respond_to :release_bike
  # end
  it { is_expected.to respond_to :release_bike }

  it 'releases a bike that is working' do
    #allow(bike).to receive(:working?).and_return(true)
    allow(bike).to receive(:broken?).and_return(false)
    # Alternative: allow(bike).to receive(:working) {true}
    # bike = double(:bike, broken?: true)
    subject.dock(bike)
    expect(subject.release_bike).to be bike
    # Changed now: expect(released_bike).to be_working  # Alternative: expect(bike.working?).to eq true
  end

  it 'fails when there are none available' do
    expect { subject.release_bike }.to raise_error 'No bikes available'
  end

  it { is_expected.to respond_to(:dock).with(1).argument }

  it 'docks a bike' do
    subject.dock(bike)
    expect(subject.bikes).to eq [bike]
  end

  it 'fails when docking station is full' do
    20.times { subject.dock(bike) }
    expect { subject.dock(bike) }.to raise_error 'Docking station full'
  end

  it 'has default capacity' do
    expect(DockingStation::CAPACITY).to eq 20
  end

  xit 'returns true if docking station full' do
    expect(subject).not_to be_full
  end

  xit 'returns true if docking station is empty' do
    expect(subject).to be_empty
  end

  it 'does not release broken bikes' do
    allow(bike).to receive(:broken?).and_return(true)
    subject.dock(bike)
    expect { subject.release_bike }.to raise_error 'No bikes available'
  end

end


