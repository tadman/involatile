class Involatile::Support::Empty
  RESERVED_METHODS = %w( __id__ __send__ __methods__ __instance_eval__ )
  
  alias_method :__methods__, :methods
  alias_method :__instance_eval__, :instance_eval
  
  instance_methods.each do |m|
    undef_method(m) unless (m[0,2] == '__')
  end
end
