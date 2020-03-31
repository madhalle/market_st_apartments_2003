require 'minitest/autorun'
require 'minitest/pride'
require './lib/renter'
require './lib/apartment'
require './lib/building'

class BuildingTest < MiniTest::Test

  def setup
    @building = Building.new

    @unit1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})
    @unit2 = Apartment.new({number: "B2", monthly_rent: 999, bathrooms: 1, bedrooms: 2})
    @unit3 = Apartment.new({number: "C3", monthly_rent: 1150, bathrooms: 2, bedrooms: 2})
    @unit4 = Apartment.new({number: "D4", monthly_rent: 1500, bathrooms: 2, bedrooms: 3})

    @renter1 = Renter.new("Aurora")
    @renter2 = Renter.new("Tim")

  end

  def test_it_exists
    assert_instance_of Building, @building
  end

  def test_building_units
    assert_equal [], @building.units
  end

  def test_add_units_to_building
    @building.add_unit(@unit1)
    @building.add_unit(@unit2)
    assert_equal [@unit1, @unit2], @building.units
  end

  def test_building_renters

    assert_equal [], @building.renters

    @unit1.add_renter(@renter1)
    @building.add_unit(@unit1)
    assert_equal ["Aurora"], @building.renters

    @unit2.add_renter(@renter2)
    @building.add_unit(@unit2)
    assert_equal ["Aurora", "Tim"], @building.renters
  end

  def test_building_average_rent
    @unit1.add_renter(@renter1)
    @building.add_unit(@unit1)
    assert_equal ["Aurora"], @building.renters

    @unit2.add_renter(@renter2)
    @building.add_unit(@unit2)
    assert_equal 1099.5, @building.average_rent
  end

  def test_rented_units
    @building.add_unit(@unit1)
    @building.add_unit(@unit2)
    @building.add_unit(@unit3)
    assert_equal [], @building.rented_units

    @unit2.add_renter(@renter1)
    assert_equal [@unit2], @building.rented_units
  end

  def test_renter_with_highest_rent

    @building.add_unit(@unit1)
    @building.add_unit(@unit2)
    @building.add_unit(@unit3)

    @unit2.add_renter(@renter1)
    assert_equal @renter1, @building.renter_with_highest_rent

    @unit1.add_renter(@renter2)
    assert_equal @renter2, @building.renter_with_highest_rent

    renter3 = Renter.new("Max")
    @unit3.add_renter(renter3)
    assert_equal @renter2, @building.renter_with_highest_rent
  end

  def test_building_units_by_number_of_bedrooms
  skip
    @building.add_unit(@unit1)
    @building.add_unit(@unit2)
    @building.add_unit(@unit3)
    @building.add_unit(@unit4)
    assert_equal [], @building.units_by_number_of_bedrooms
  end




  # pry(main)> building.units_by_number_of_bedrooms
  # # =>
  # # {
  # #   3 => ["D4" ],
  # #   2 => ["B2", "C3"],
  # #   1 => ["A1"]
  # # }
  # ```

end
