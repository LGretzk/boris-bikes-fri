require 'bike'

describe Bike do
    # it 'responds to the method working?' do
    #     expect(Bike.new).to respond_to(:working?)
    # end

    it { is_expected.to respond_to :working?}

    # These 3 'it' statements do the same thing
    # it 'returns a working bike' do
    #     expect(Bike.new.working?).to eq true
    # end

    # it 'returns a working bike' do
    #     expect(Bike.new).to be true  # different to 'be_truthy' which evaluates to true if returned value is anything other than 'false' or 'nil'
    # end

    # Predicate matcher
    it 'returns a working bike' do
        expect(Bike.new).to be_working
    end

end