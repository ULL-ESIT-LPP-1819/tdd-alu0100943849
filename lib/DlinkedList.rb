require 'nutrientes/version'

Node = Struct.new(:value, :next, :prev)

class DlinkedList < Node
    
    attr_reader :head, :tail, :current
    
    def initialize()
        
        @head = @tail = @current = nil
        
    end
    
    def insertTail(value)
        
        n = Node.new(value)
        
        if @head.nil?
            
            @head = n
            @tail = n
            @current = @head
            
        else
            
            @tail.next = n
            n.prev = @tail
            @tail = n
            @current = @tail
            
        end
        
    end
    
    def insertHead(value)
        
        n = Node.new(value)
        
        if @head.nil?
            
            @head = n
            @tail = n
            @current = @head
            
        else
            
            @head.next = n
            n.prev = @head
            @head = n
            @current = @head
            
        end
        
    end
    
end