module Involatile::SQL::Exception
  class InvalidIdentifier < Exception
    def initialize(property, value)
      @property = property
      @value = value
    end
  end
end
