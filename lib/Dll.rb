require 'nutrientes/version'
require 'Nutricional_label'


Node = Struct.new(:value, :next, :prev)

class Dll 
    
    attr_reader :head, :tail, :current
    
    def initialize
        
        @head = @tail = @current = nil
        
    end
    
end