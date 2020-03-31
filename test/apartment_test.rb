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
  # pry(main)> unit1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})
  # # => #<Apartment:0x00007fb3ecaae7c0...>
  #
  # pry(main)> unit1.number
  # # => "A1"
  #
  # pry(main)> unit1.monthly_rent
  # # => 1200
  #
  # pry(main)> unit1.bathrooms
  # # => 1
  #
  # pry(main)> unit1.bedrooms
  # # => 1
  #
  # pry(main)> unit1.renter
  # # => nil
  #
  # pry(main)> unit1.add_renter(renter1)
  #
  # pry(main)> unit1.renter
  # # => #<Renter:0x00007fb3ee106ce8...>
end
