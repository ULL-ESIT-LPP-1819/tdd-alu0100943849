require 'nutrientes/version'

Node = Struct.new(:value, :next, :prev)

class DlinkedList
    
    attr_reader :head, :tail
    
    def initialize()
        
        @head = @tail = nil
        
    end
    
    def insertTail(value)
        
        n = Node.new(value)
        
        if @head.nil?
            
            @tail = n
            @head = @tail
            
        else
            
            @tail.next = n
            n.prev = @tail
            @tail = n
            
        end
        
    end
    
    def insertHead(value)
        
        n = Node.new(value)
        
        if @head.nil?
            
            @head = n
            @tail = @head
            
        else
            
            @head.next = n
            n.prev = @head
            @head = n
            
        end
        
    end
    
    def popHead
        
    end
    
    def popTail
        
    end
    
    def removeAll
        
    end
    
end