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
end
