class Involatile::SQL::Table
  autoload :Column, 'involatile/sql/table/column'
  autoload :Index, 'involatile/sql/table/index'
  
  def self.name_valid?(value)
    true
  end
  
  def initialize(name, options = { })
    @name = name
  end
  
  def name
  end
  
  def name=(value)
    if (self.class.name_valid?(value))
      @name = value
    else
      raise Exception::InvalidIdentifier, name, value
    end
  end
  
  def create
    ''
  end
  
  def drop
    ''
  end
  
  def to_sql
    ''
  end
  alias_method :to_s, :to_sql
  
  def exists?
    # IMPLEMENT
  end
  
  def create!
    create.execute!
  end

  def recreate!
    drop.execute! if (exists?)
    create.execute!
  end

  def drop!
    drop.execute!
  end
end
