require 'minitest/autorun'
require 'minitest/pride'
require './lib/renter'

class RenterTest < Minitest::Test
  def setup
    @renter1 = Renter.new("Jessie")
  end

  def test_renter_has_name
    assert_equal "Jessie", @renter1.name
  end

  ## Iteration 1

  # Use TDD to create a Renter class and an Apartment class that respond to the following interaction pattern:
  #
  # ```ruby
  # pr

end
