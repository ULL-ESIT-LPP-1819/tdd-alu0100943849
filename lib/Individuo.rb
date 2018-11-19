require 'nutrientes/version'
require 'Antropometrico'

class Individuo 
    
    attr_reader :nombre
    
    def initialize(nombre)
        @nombre = nombre
        @datos = nil
    end
    
    def es (other)
        if other.is_a? Individuo
          @nombre == other.nombre
        elsif
          false
        end
    end
    
    def to_s
        puts "#{nombre}"
    end
    
end

class Pacientes < Individuo
    
    attr_reader :datos
    
    def initialize(nombre,datos)
        super(nombre)
        @datos = datos
    end
    
    def == (other)
        if other.is_a? Individuo
            nombre == other.nombre
        elsif
            false
        end
    end
    
    def indice_corporal
        
    end
    
    def to_s
        "#{nombre} #{indice_corporal}"
    end

end



