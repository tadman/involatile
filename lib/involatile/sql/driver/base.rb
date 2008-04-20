module Involatile
  autoload(:Driver, 'involatile/sql/db')
end

class Involatile::SQL::Driver::Base
  def initialize(options = { })
  end
end
