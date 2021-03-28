require 'rspec'
require './lib/venue'

describe Venue do
  describe '#initialize' do
    it 'is a venue' do
      venue = Venue.new('Bluebird', 4)
      expect(venue).to be_a(Venue)
    end

    it 'can read the name' do
      venue = Venue.new('Bluebird', 4)
      expect(venue.name).to eq('Bluebird')
    end

    it 'can read the capacity' do
      venue = Venue.new('Bluebird', 4)
      expect(venue.capacity).to eq(4)
    end

    it 'has no patrons by default' do
      venue = Venue.new('Bluebird', 4)
      expect(venue.patrons).to eq([])
    end
  end

  # Iteration 2

  describe '#add_patron' do
    it 'returns a list of patrons' do
      venue = Venue.new('Bluebird', 4)
      venue.add_patron('Mike')
      venue.add_patron('Megan')
      venue.add_patron('Bob')

      expect(venue.patrons).to eq(['Mike', 'Megan', 'Bob'])
    end
  end

  describe '#yell_at_patrons' do
    it 'returns a list of uppercased names' do
      venue = Venue.new('Bluebird', 4)
      venue.add_patron('Mike')
      venue.add_patron('Megan')
      venue.add_patron('Bob')


      expect(venue.yell_at_patrons).to eq(['MIKE', 'MEGAN', 'BOB'])
    end
  end

  describe '#over_capacity' do
    it 'returns false for over max capacity' do
      venue = Venue.new('Bluebird', 4)
      venue.add_patron('Mike')
      venue.add_patron('Megan')
      venue.add_patron('Bob')

      expect(venue.over_capacity?).to eq(false)
    end

    it 'returns capacity number' do
      venue = Venue.new('Bluebird', 4)
      venue.add_patron('Mike')
      venue.add_patron('Megan')
      venue.add_patron('Bob')

      expect(venue.total_capacity).to eq(3)
    end

    it 'returns true for over capacity' do
      venue = Venue.new('Bluebird', 4)
      venue.add_patron('Mike')
      venue.add_patron('Megan')
      venue.add_patron('Bob')
      venue.add_patron('James')
      venue.add_patron('Cat')

      expect(venue.over_capacity?).to eq(true)
    end

    it 'can remove patrons' do
      venue = Venue.new('Bluebird', 4)
      venue.add_patron('Mike')
      venue.add_patron('Megan')
      venue.add_patron('Bob')
      venue.add_patron('James')
      venue.add_patron('Cat')
      venue.kick_out('James')
      venue.kick_out('Cat')

      expect(venue.patrons).to eq(['Mike', 'Megan', "Bob"])
    end
  end
end
