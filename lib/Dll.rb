require 'nutrientes/version'
require 'Nutricional_label'

Node = Struct.new(:value, :next, :prev)

class Dll < Node
    
    attr_reader :head, :tail, :current
    
    def initialize()

        @head = @tail = @current = nil
        
    end
    
    def insert(n)
        
        if @head.nil?
            
            @head = n
            @tail = @head
            @current = @head
            
        else
            
            @current.next = n
            @tail = n
            @tail.prev = @current
            @current = @tail
            
        end
        
    end
    
    
    def get_next_n

        puts "head #{@head}"
        
    end
    
end