class Building
  attr_reader :units, :renters
  def initialize
    @units = []
    @renters = []
  end

  def add_unit(unit)
    @units << unit
  end

  def renters
    @units.each do |unit|
      if unit.renter != nil
        @renters << unit.renter.name
      end
    end
    @renters
  end

  def average_rent
    unit_rent = []
    @units.each do |unit|
      unit_rent << unit.monthly_rent
    end
    avg_rent = unit_rent.sum / unit_rent.size.to_f
    avg_rent
  end

  def rented_units
    rented_units = []
    @units.each do |unit|
      if unit.renter != nil
        rented_units << unit
      end
    end
    rented_units
  end

  def renter_with_highest_rent
    rents = []
    highest_rent = nil
    @units.each do |unit|
      if unit.renter != nil
        rents << unit.monthly_rent
      end
    end
    rents.sort.last
    @units.each do |unit|
      if unit.monthly_rent == rents.sort.last
        highest_rent = unit.renter
      end
    end
    highest_rent
  end

  def units_by_number_of_bedrooms
    @units.group_by do |unit|
      unit.bedrooms
    #require "pry"; binding.pry
    end
  end
  # def units_by_number_of_bedrooms
  #   three_bedroom = []
  #   two_bedroom = []
  #   one_bedroom = []
  #   keys = []
  #   @units.each do |unit|
  #     three_bedroom << unit.number if unit.bedrooms == 3
  #     two_bedroom << unit.number if unit.bedrooms == 2
  #     one_bedroom << unit.number if unit.bedrooms == 1
  #     keys << unit.bedrooms
  #   end
  #   require "pry"; binding.pry
  #   keys.sort.uniq
  #   #[[:3, three_bedroom], [:2, two_bedroom], [:1, one_bedroom]].to_h
  #   # a = [[:3, three_bedroom], [:2, two_bedroom], [:1, one_bedroom]]
  #   # h = Hash[*a]
  #   # h
  # end

  # def units_by_number_of_bedrooms
  #   three_bedroom = []
  #   two_bedroom = []
  #   one_bedroom = []
  #   @units.each do |unit|
  #     three_bedroom << unit.number if unit.bedrooms == 3
  #     two_bedroom << unit.number if unit.bedrooms == 2
  #     one_bedroom << unit.number if unit.bedrooms == 1
  #   end
  #   require "pry"; binding.pry
  #   #[[:3, three_bedroom], [:2, two_bedroom], [:1, one_bedroom]].to_h
  #   # a = [[:3, three_bedroom], [:2, two_bedroom], [:1, one_bedroom]]
  #   # h = Hash[*a]
  #   # h
  # end
  #
  # def units_by_number_of_bedrooms
  #   sorted_by_bedroom = []
  #   @units.group_by do |unit|
  #     unit.bedrooms
  #     sorted_by_bedroom << unit
  #   end
  #   require "pry"; binding.pry
  #   breakdown = {}
  #   @units.bedrooms.each do |bedroom|
  #    breakdown[bedroom] = units_by_number_of_bedrooms(bedroom)
  #   end
  #   breakdown
  # end
end
