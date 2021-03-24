class Venue
  attr_reader :name,
              :capacity,
              :patrons
  def initialize(name, capacity)
    @name = name
    @capacity = capacity
    @patrons = []
  end

  def add_patron(patron)
    @patrons << patron
  end

  def yell_at_patrons
    names_upcase = []
    @patrons.each do |patron|
      names_upcase << patron.upcase
    end
    names_upcase
  end

  def total_capacity
    counter = 0
    total = @patrons.count do |patron|
      counter += 1
    end
    counter
    # require 'pry'; binding.pry
  end

  def over_capacity?
    if total_capacity >= @capacity
      true
    else
      false
    end
  end

  def kick_out(patron)
    # require 'pry'; binding.pry
    @patrons.delete(patron)
  end
end
