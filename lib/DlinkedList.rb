require 'nutrientes/version'
require 'Nutricional_label'

Node = Struct.new(:value, :next, :prev)

class DlinkedList < Node
    
    attr_reader :head, :tail, :current
    
    def initialize
        
        @head = @tail = @current = nil
        
    end
    
    def insertTail(value)
        
        
        
    end
    
    def insertHead(value)
        
       
        
    end
    
end