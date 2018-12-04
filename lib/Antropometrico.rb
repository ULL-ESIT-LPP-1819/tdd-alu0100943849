require 'nutrientes/version'
require 'Individuo'

class Antropometrico
   
    attr_reader :peso, :talla, :edad, :sexo, :cintura, :cadera
   
    def initialize(sexo, peso,talla,edad,cintura,cadera)
        @sexo = sexo
        @peso = peso
        @talla = talla
        @edad = edad
        @cintura = cintura
        @cadera = cadera
    end
    
    def indice_masa_corporal
        @imc = @peso / (@talla * @talla)
        @imc.round(1)
    end
    
    def porcentaje_grasa
        @resul = (1.2 * ( @peso / (@talla * @talla) )) + (0.23 * @edad) - (10.8 * @sexo) - 5.4
        @resul.round(2)
    end
    
    def rCC
        @rcc = (@cintura/@cadera)
        @rcc.round(2)
    end
    
    def to_s
        "#{@imc}, #{@resul}, #{@rcc}"
    end
end