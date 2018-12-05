# @author Carlos Arvelo Garcia (alu0100943849)

require 'nutrientes/version'
require 'Individuo'

#Clase Antropometrico almacena los datos del paciente

class Antropometrico
    
    include Comparable
   
    attr_reader :peso, :talla, :edad, :sexo, :cintura, :cadera
   
    def initialize(sexo, peso,talla,edad,cintura,cadera)
        @sexo = sexo
        @peso = peso
        @talla = talla
        @edad = edad
        @cintura = cintura
        @cadera = cadera
    end
    
    # Calcula el indice de masa corporal mediante la funcion (peso/(talla^2))
    #
    # == Parameters:
    # No recibe parametros
    #
    # == Returns:
    # Una variable con el resultado de  la operación
    def indice_masa_corporal
        @imc = @peso / (@talla * @talla)
        @imc.round(1)
    end
    
    # Calcula el porcentaje de grasa mediante la funcion (1,2 × IMC + 0,23 × edad − 10,8 × sexo − 5,4)
    #
    # == Parameters:
    # No recibe parametros
    #
    # == Returns:
    # Una variable con el resultado de  la operación
    def porcentaje_grasa
        @resul = (1.2 * ( @peso / (@talla * @talla) )) + (0.23 * @edad) - (10.8 * @sexo) - 5.4
        @resul.round(2)
    end
    
    # Calcula la relacion entre circunferencia de cadera y cintura mediante la funcion (cir. cintura / cir cadera)
    #
    # == Parameters:
    # No recibe parametros
    #
    # == Returns:
    # Una variable con el resultado de  la operación
    def rCC
        @rcc = (@cintura/@cadera)
        @rcc.round(2)
    end
    
    # Define el metodo para compara elementos de tipo Antropometrico
    #
    # == Parameters:
    # Recibe un parametro de tipo Antropometrico
    #
    # == Returns:
    # Un balor booleano dependiendo del resultado de la operacion
    def <=>(other)
        indice_masa_corporal <=> other.indice_masa_corporal
    end
    
    # Define el metodo para imprimir por pantalla 
    #
    # == Parameters:
    # No recibe ninguno
    #
    # == Returns:
    # Un string con el contenido de las variables
    def to_s
        "#{@imc}, #{@resul}, #{@rcc}"
    end
end