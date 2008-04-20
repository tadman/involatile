require '../../test_kit'

class MethodReceiver
  def initialize
    @received = [ ]
  end
  
  def received
    @received
  end
  
  def receive_call(name, *args)
    @received << [ name ] + args
  end
end

class MethodCatcherTest < Test::Unit::TestCase
  def test_receive_calls
    receiver = MethodReceiver.new
    
    return_value = Involatile::Support::MethodCatcher.receive_calls(receiver) do |c|
       # Call blocked by variable of same name
      receiver
      
      # Call succeeds if made directly
      c.receiver
      
      # Call with parameter always succeeds
      receiver 1
      
      # Calls can have zero or more arguments
      foo
      bar 'foo', :star
    end
    
    assert_equal [ [ :receiver ], [ :receiver, 1 ], [ :foo ], [ :bar, 'foo', :star ] ], receiver.received
    assert_equal [ [ :receiver ], [ :receiver, 1 ], [ :foo ], [ :bar, 'foo', :star ] ], return_value
  end
end
