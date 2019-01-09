class Menu
    
    attr_accessor :dia, :titulo_menu, :tiempo_comida, :desayunos, :comidas, :cenas, :val_ener, :vet
    
    def initialize(dia, &block)
        @dia = dia
        @titulo_menu = nil
        @tiempo_comida = []
        @desayunos = []
        @comidas = []
        @cenas = []
        @val_ener = nil
        @vet = 0
        
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
    
    def valor_energetico(grasas, carbohidratos, proteinas, fibra, sal)
        if grasas == nil then grasas = 0 end
        if carbohidratos == nil then carbohidratos = 0 end
        if proteinas == nil then proteinas = 0 end
        if fibra == nil then fibra = 0 end
        if sal == nil then sal = 0 end
            
        @val_ener = (grasas * 9) + (carbohidratos * 4) + (proteinas * 4) + (fibra * 4) + (sal * 6)
        @vet += @val_ener
    end
    
    def ingesta(options = {})
        time = " #{options[:min]}" if options[:min]
        time << " #{options[:max]}" if options[:max]
        
        @tiempo_comida << time
    end
    
    def desayuno(options = {})
        breakfast = sprintf(" %-25s", "\"#{options[:descripcion]}\"")
        breakfast << sprintf(" %-15s", "#{options[:porcion]}")
        breakfast << sprintf(" %-10s", "#{options[:gramos]}")
        breakfast << sprintf(" %-10s", "#{options[:grasas]}")
        breakfast << sprintf(" %-15s", "#{options[:carbohidratos]}")
        breakfast << sprintf(" %-12s", "#{options[:proteinas]}")
        breakfast << sprintf(" %-8s", " #{options[:fibra]}")
        breakfast << sprintf(" %-7s", "#{options[:sal]}")
        
        valor_energetico(options[:grasas], options[:carbohidratos], options[:proteinas], options[:fibra], options[:sal])
        breakfast << sprintf(" %-10s", "#{@val_ener}")
        
        @desayunos << breakfast
    end
    
    def comida(options = {})
        meal = sprintf(" %-25s", "\"#{options[:descripcion]}\"")
        meal << sprintf(" %-15s", "#{options[:porcion]}")
        meal << sprintf(" %-10s", "#{options[:gramos]}")
        meal << sprintf(" %-10s", "#{options[:grasas]}")
        meal << sprintf(" %-15s", "#{options[:carbohidratos]}")
        meal << sprintf(" %-12s", "#{options[:proteinas]}")
        meal << sprintf(" %-8s", " #{options[:fibra]}")
        meal << sprintf(" %-7s", "#{options[:sal]}")
        
        valor_energetico(options[:grasas], options[:carbohidratos], options[:proteinas], options[:fibra], options[:sal])
        meal << sprintf(" %-10s", "#{@val_ener}")
        
        @comidas << meal
    end
    
    def cena(options = {})
        dinner = sprintf(" %-25s", "\"#{options[:descripcion]}\"")
        dinner << sprintf(" %-15s", "#{options[:porcion]}")
        dinner << sprintf(" %-10s", "#{options[:gramos]}")
        dinner << sprintf(" %-10s", "#{options[:grasas]}")
        dinner << sprintf(" %-15s", "#{options[:carbohidratos]}")
        dinner << sprintf(" %-12s", "#{options[:proteinas]}")
        dinner << sprintf(" %-8s", " #{options[:fibra]}")
        dinner << sprintf(" %-7s", "#{options[:sal]}")
        
        valor_energetico(options[:grasas], options[:carbohidratos], options[:proteinas], options[:fibra], options[:sal])
        dinner << sprintf(" %-10s", "#{@val_ener}")
        
        @cenas << dinner
    end
    
    def to_s
       
        cout = "\n" + @dia + "     " + @titulo_menu + "                 Composicion nutricional"
        cout << "\n#{'=' * cout.size}\n"
        
        header=sprintf("%34s %14s %10s %17s %12s %7s %6s %20s\n","porcion", "gramos", "grasas", "carbohidratos", "proteinas", "fibra", "sal", "valor energetico")
    
        cout << header
        cout << "Desayuno\n"
        @desayunos.each do |aux|
          cout << "#{aux}\n"
        end
        
        cout << "\ncomida\n"
        @comidas.each do |aux2|
          cout << "#{aux2}\n"
        end
        
        cout << "\ncena\n"
        @cenas.each do |aux3|
          cout << "#{aux3}\n"
        end
        
        cout << "\nvalor energetico total #{@vet.round(2)}" + "\n"
        cout
       
    end
    
end