require '../../test_kit'
require 'involatile/sql/query'

class QueryTest < Test::Unit::TestCase
  def setup
    # ...
  end
  
  def test_basic
    query = Involatile::SQL::Query.find
    
    assert query
    
    assert_equal :find, query.type
    assert_equal :all, query.limit
  end
  
  def test_find_all
    query = Involatile::SQL::Query.table().find(:all)
    
    assert true
    
    assert !query.valid?
  end
  
  def test_create_table_column_insertion
    query = Involatile::SQL::Query.table(:test_table).create do |table|
      table.columns << query.column(:bitshift, String)
      table.columns += [ query.column(:add, String) ]
      table.columns.unshift(query.column(:unshift, String))
      table.columns.push(query.column(:push, String))
    end
    
    assert_equal '', query.to_sql
    
    assert query.execute!
  end

  def test_describe_table
    query = Involatile::SQL::Query.table(:test_table).describe
    
    query.columns << query.column(:id, Fixnum, :primary_key => true)
    query.columns << query.column(:user_id, Fixnum, :null => false)
    query.columns << query.column(:comment, String, :null => false)
    
    # ...
  end
  
  def test_drop_table
  end
  
protected
  def create_test_table(name = :test_table)
    query = Involatile::SQL::Query.table(:test_table)
    
    query.columns.create do
      id(Fixnum, :primary_key => true)
      user_id(Fixnum, :null => false)
      comment(String, :null => false, :default => '')
    end
    
    query.execute!
  end
end
