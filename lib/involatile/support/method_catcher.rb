class Involatile::Support::MethodCatcher < Involatile::Support::Empty
  def self.receive_calls(object = nil, &block)
    catcher = new(object)
    
    catcher.__instance_eval__(&block)
    
    catcher.__received_calls__
  end
  
  def initialize(receiver = nil)
    @receiver = receiver
    @received_calls = [ ]
  end
  
  def __received_calls__
    @received_calls
  end
  
  def method_missing(name, *args)
    @received_calls << [ name ] + args
    @receiver.send(:receive_call, name, *args)
  end
end
