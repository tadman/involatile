require '../../test_kit'

class EmptyTest < Test::Unit::TestCase
  def test_empty_methods
    assert_equal Involatile::Support::Empty::RESERVED_METHODS.sort, Involatile::Support::Empty.new.__methods__.sort
  end
end
