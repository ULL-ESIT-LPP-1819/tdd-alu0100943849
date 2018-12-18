# @author Carlos Arvelo Garcia (alu0100943849)

require 'nutrientes/version'

#Struct Node almacena los datos antropometricos

Node = Struct.new(:value, :next, :prev)

#Clase DlinkedList almacena los datos en una lista

class DlinkedList
    
    include Enumerable
    
    attr_reader :head, :tail
    
    def initialize()
        
        @head = @tail = nil
        
    end
    
    # Inserta por la cola de la lista un nodo
    #
    # == Parameters:
    # Recive un valor o dato que se quiera insertar
    #
    # == Returns:
    # No retorna nada
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
    
    # Inserta por la cabeza de la lista un nodo
    #
    # == Parameters:
    # Recive un valor o dato que se quiera insertar
    #
    # == Returns:
    # No retorna nada
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
    
    # Extrae por la cabeza de la lista un nodo
    #
    # == Parameters:
    # No recibe nada
    #
    # == Returns:
    # Retorna el nodo extraido
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
    
    # Extrae por la cola de la lista un nodo
    #
    # == Parameters:
    # No recibe nada
    #
    # == Returns:
    # Retorna el nodo extraido
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
    
    # Extrae por la cabeza de la lista todos los nodos que quedan en la lista si no esta vacia
    #
    # == Parameters:
    # No recibe nada
    #
    # == Returns:
    # Retorna los nodos extraidos
    def removeAll
        
        if @head.value.nil? and @tail.value.nil?
           
        puts "lista vacia"
        
        else
            
            while @head != nil
                
                aux = @head.next
                self.popHead
                @head = aux
                aux
            end
            
        end
        
    end
    
    # Recorre la lista desde la cabeza hasta a cola
    #
    # == Parameters:
    # No recibe nada
    #
    # == Returns:
    # No retorna nada
    def each
       
        nodo = @head
        while nodo != nil
       
            yield nodo.value
            nodo = nodo.next
            
        end
        
    end
    
    # Define el metodo para imprimir por pantalla 
    #
    # == Parameters:
    # No recibe ninguno
    #
    # == Returns:
    # Un string con el contenido de las variables
    def to_s
        
       each {|x| puts x}
       
    end
      
   
    
end