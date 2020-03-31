class Building
  attr_reader :units, :renters
  def initialize
    @units = []
    @renters = []
  end

  def add_unit(unit)
    @units << unit
    if unit.renter != nil
      @renters << unit.renter.name
    end
  end

  def average_rent
    unit_rent = []
    @units.each do |unit|
      unit_rent << unit.monthly_rent
    end
    avg_rent = unit_rent.sum / unit_rent.size.to_f
    avg_rent
  end

end
