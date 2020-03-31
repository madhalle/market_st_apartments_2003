require 'minitest/autorun'
require 'minitest/pride'
require './lib/renter'
require './lib/apartment'

class ApartmentTest < MiniTest::Test
  def setup
    @unit1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})
  end

  def test_apartment_number
    assert_equal "A1", @unit1.numer
  end

  def test_monthly_rent
     assert_equal 1200, @unit1.monthly_rent
  end

  def test_number_of_bathrooms
     assert_equal 1, @unit1.bathrooms
  end

  def test_unit_bedrooms
    assert_equal 1, @unit1.bedrooms
  end

  def test_unit_renter_object
    assert_equal nil, @unit1.renter
  end

  def test_add_renter
    renter1 = Renter.new("Jessie")
    @unit1.add_renter(renter1)
    assert_equal renter1, @unit1.renter
  end
end
