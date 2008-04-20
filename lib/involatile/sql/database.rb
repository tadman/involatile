class Involatile::SQL::Database
  def initialize(name, options = { })
  end
  
  def create
    # Returns a query?
    ''
  end
  
  def tables
    # Proxy accessor here
    # ...
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
    create.execute!
  end
end
