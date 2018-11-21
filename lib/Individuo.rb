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
        if @datos.indice_masa_corporal <= 18.5
            "Bajo peso"
        elsif @datos.indice_masa_corporal > 18.5 and @datos.indice_masa_corporal <= 24.9
            "Peso adecuado"
        elsif @datos.indice_masa_corporal > 25.0 and @datos.indice_masa_corporal <= 29.9
            "Sobrepeso"
        elsif @datos.indice_masa_corporal > 30.0 and @datos.indice_masa_corporal <= 34.9
            "Obesidad grado 1"
        elsif @datos.indice_masa_corporal > 35.0 and @datos.indice_masa_corporal <= 39.9
            "Obesidad grado 2"
        elsif @datos.indice_masa_corporal > 40
            "Obesidad grado 3"
        end
    end
    
    def to_s
        "#{indice_corporal}"
    end

end



