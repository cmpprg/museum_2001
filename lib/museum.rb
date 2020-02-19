class Museum

  attr_reader :name, :exhibits, :patrons
  def initialize(name)
    @name = name
    @exhibits = []
    @patrons = []
  end

  def add_exhibit(exhibit)
    @exhibits << exhibit
  end

  def recommend_exhibits(patron)
    @exhibits.find_all do |exhibit|
      patron.interests.include?(exhibit.name)
    end
  end

  def admit(patron)
    @patrons << patron
  end

  def patrons_by_exhibit_interest
    @exhibits.reduce({}) do |patron_by_exhibit, exhibit|
      patrons = @patrons.find_all{|patron| patron.interests.include?(exhibit.name)}
      patron_by_exhibit[exhibit] = patrons
      patron_by_exhibit
    end
  end
end
