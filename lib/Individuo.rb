require 'nutrientes/version'
require 'Antropometrico'

class Individuo 
    
    attr_reader :nombre
    
    def initialize(nombre)
        @nombre = nombre
        @datos = nil
    end
    
end

class Pacientes < Individuo
    
    attr_reader :datos
    
    def initialize(nombre,datos)
        super(nombre)
        @datos = datos
    end

end



