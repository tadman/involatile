class Involatile::SQL::Query
  # == Class Methods ========================================================
  
  # -- Construction Methods -------------------------------------------------
  
  def self.find(limit = :all, options = { })
    new(:find, :limit => limit)
  end
  
  def self.table(name, options = { })
    # ...
  end
  
  def self.create_table(name, options = { })
    new(:create_table)
  end
  
  def self.database(name, options = { })
    # IMPLEMENT
  end

  def self.create_database(name, options = { })
    new(:create_database)
  end
  
  def self.drop_table(options = { })
    new(:drop_table)
  end

  def self.drop_database(options = { })
    new(:drop_table)
  end
  
  def self.insert(options = { })
    new(:insert)
  end
  
  def self.update(options = { })
    new(:update)
  end
  
  def self.delete(options = { })
    new(:delete)
  end
  
  # == Instance Methods =====================================================
  
  def initialize(type = nil, options = { })
    @type = type
    @limit = :all
    # ...
  end
  
  # -- Differentiators ------------------------------------------------------
  
  def table(name)
  end
  
  def columns
    [ ]
  end
  
  def columns=(list)
  end
  
  # -- Factory Methods ------------------------------------------------------
  
  def column(name, klass, definition)
  end
  
  def index(name, *column)
  end
    
  # -- Accessors/Mutators ---------------------------------------------------
  
  def type
    @type
  end
  
  def limit
    @limit
  end
  
  def offset
    @offset
  end
  
  def tables
    [ ]
  end
  
  def to_sql
    # ...
    ''
  end
  alias_method :to_s, :to_sql
  
  # -- Validation -----------------------------------------------------------
  
  def valid?
    false
  end
  
  # -- Enumerable compatability ---------------------------------------------
  
  def [](index)
  end
  
  def first
  end
  
  def last
  end
  
  def each(&block)
  end
  
  def collect(&block)
  end
end
