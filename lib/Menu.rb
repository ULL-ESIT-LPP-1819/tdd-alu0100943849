class Menu
    
    attr_accessor :dia, :titulo_menu, :tiempo_comida, :desayunos, :comidas, :cenas
    
    def initialize(dia, &block)
        @dia = dia
        @titulo_menu = nil
        @tiempo_comida = []
        @desayunos = []
        @comidas = []
        @cenas = []
        
        if block_given?  
            if block.arity == 1
                yield self
            else
                instance_eval(&block) 
            end
        end
    end
    
    def titulo(nombre)
       
      @titulo_menu = nombre
        
    end
    
    def ingesta(options = {})
       
    end
    
    def desayuno(options = {})
        
    end
    
    def comida(options = {})
       
    end
    
    def cena(options = {})
       
    end
    
    def to_s
       
    end
    
end