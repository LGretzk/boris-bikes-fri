require 'docking_station'

describe DockingStation do
    
    # it 'responds to responds to release_bike' do
    #     expect(DockingStation.new).to respond_to :release_bike
    # end

    it { is_expected.to respond_to :release_bike }

    it 'releases a bike that is working' do
        bike = subject.release_bike
        expect(bike).to be_working  # Alternative: expect(bike.working?).to eq true
    end

end