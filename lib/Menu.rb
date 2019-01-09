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
        time = " #{options[:min]}" if options[:min]
        time << " #{options[:max]}" if options[:max]
        
        @tiempo_comida << time
    end
    
    def desayuno(options = {})
        breakfast = sprintf(" %s", "\"#{options[:descripcion]}\"")
        breakfast << sprintf(" %s", "#{options[:porcion]}")
        breakfast << sprintf(" %s", "#{options[:gramos]}")
        breakfast << sprintf(" %s", "#{options[:grasas]}")
        breakfast << sprintf(" %s", "#{options[:carbohidratos]}")
        breakfast << sprintf(" %s", "#{options[:proteinas]}")
        breakfast << sprintf(" %s", " #{options[:fibra]}")
        breakfast << sprintf(" %s", "#{options[:sal]}")
        
        desayunos << breakfast
    end
    
    def comida(options = {})
        meal = sprintf(" %s", "\"#{options[:descripcion]}\"")
        meal << sprintf(" %s", "#{options[:porcion]}")
        meal << sprintf(" %s", "#{options[:gramos]}")
        meal << sprintf(" %s", "#{options[:grasas]}")
        meal << sprintf(" %s", "#{options[:carbohidratos]}")
        meal << sprintf(" %s", "#{options[:proteinas]}")
        meal << sprintf(" %s", " #{options[:fibra]}")
        meal << sprintf(" %s", "#{options[:sal]}")
        
        comidas << meal
    end
    
    def cena(options = {})
        dinner = sprintf(" %s", "\"#{options[:descripcion]}\"")
        dinner << sprintf(" %s", "#{options[:porcion]}")
        dinner << sprintf(" %s", "#{options[:gramos]}")
        dinner << sprintf(" %s", "#{options[:grasas]}")
        dinner << sprintf(" %s", "#{options[:carbohidratos]}")
        dinner << sprintf(" %s", "#{options[:proteinas]}")
        dinner << sprintf(" %s", " #{options[:fibra]}")
        dinner << sprintf(" %s", "#{options[:sal]}")
        
        cenas << dinner
    end
    
    def to_s
       
    end
    
end