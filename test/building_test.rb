require 'minitest/autorun'
require 'minitest/pride'
require './lib/renter'
require './lib/apartment'
require './lib/building'

class BuildingTest < MiniTest::Test
  
  def setup
    @building = Building.new
    @unit1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})
    @unit2 = Apartment.new({number: "B2", monthly_rent: 999, bathrooms: 2, bedrooms: 2})
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

    renter1 = Renter.new("Aurora")
    @unit1.add_renter(renter1)
    assert_equal ["Aurora"], @building.renters

    renter2 = Renter.new("Tim")
    @unit2.add_renter(renter2)
    assert_equal ["Aurora", "Tim"], @building.renters
  end

  def test_building_average_rent
    assert_equal 1099.5, @building.average_rent
  end

end
