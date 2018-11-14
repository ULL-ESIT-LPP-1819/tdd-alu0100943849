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
        
        unless @head.nil?
            
            aux = @head
            unless @head.next.nil?
            
                @head.next.prev = nil
                @head = @head.next
                
            else
                
                @head = nil
                @tail = nil
                
            end
            aux
            
        end
        
    end
    
    def popTail
        
        unless @tail.nil?
            
            aux = @tail
            unless @tail.prev.nil?
            
                @tail.prev.next = nil
                @tail = @tail.prev
                
            else
                
                @head = nil
                @tail = nil
                
            end
            aux
            
        end
        
    end
    
    def removeAll
        
        if @head.value.nil? and @tail.value.nil?
           
        puts "lista vacia"
        
        else
            
            while @head != nil
                
                aux = @head.next
                self.popHead
                @head = aux
            
            end
            
        end
        
    end
    
    def each
       
        nodo = @head
        while nodo != nil
       
            yield nodo.value      
            nodo = nodo.next
            
        end
        
    end
    
    def to_s
        
       each {|x| puts x}
        
    end
        
end