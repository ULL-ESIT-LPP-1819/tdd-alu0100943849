# @author Carlos Arvelo Garcia (alu0100943849)

require 'nutrientes/version'
require 'DlinkedList'

#Clase Nutricional_label almacena los datos de los alimentos

class Nutricional_label
    
    include Comparable

    attr_reader :nombre_etiqueta, :grasa, :grasa_saturada, :hid_carbono, :azucares, :proteinas, :sal
    
    def initialize (nombre_etiqueta,grasa,grasa_saturada,hid_carbono,azucares,proteinas,sal)
        @nombre_etiqueta = nombre_etiqueta
        @grasa = grasa
        @grasa_saturada = grasa_saturada
        @hid_carbono = hid_carbono
        @azucares = azucares
        @proteinas = proteinas
        @sal = sal
    end
    
    # Calcula el valor energetico de un alimento en KJ
    #
    # == Parameters:
    # No recibe parametros
    #
    # == Returns:
    # Una variable con el resultado de  la operación 
    def energetic_value_KJ
        @kj = (@grasa * 37) + (@grasa_saturada * 37) + (@hid_carbono * 17) + (@azucares * 17) + (@proteinas * 17) + (@sal * 25)
    end
    
    # Calcula el valor energetico de un alimento en Kcal
    #
    # == Parameters:
    # No recibe parametros
    #
    # == Returns:
    # Una variable con el resultado de  la operación 
    def energetic_value_Kcal
        @kcal = (@grasa * 9) + (@grasa_saturada * 9) + (@hid_carbono * 4) + (@azucares * 4) + (@proteinas * 4) + (@sal * 6)
    end
    
    # Imprime la etiqueta de informacion nutricional del alimento
    #
    # == Parameters:
    # No recibe parametros
    #
    # == Returns:
    # No retorna nada
    def print_label
        puts "#{@nombre_etiqueta}"
        puts "\nValor energetico o nutriente    | por 100g o 100ml de producto "
        puts "--------------------------------|--------------------------------"
        puts "valor energetico                |" + " #{energetic_value_KJ}" + " KJ/" + "#{energetic_value_Kcal}" + " Kcal"
        puts "Camtidad de grasas              |" + " #{@grasa}g"
        puts "Camtidad de grasas saturadas    |" + " #{@grasa_saturada}g"
        puts "Camtidad de hidratos de carbono |" + " #{@hid_carbono}g"
        puts "Camtidad de azucares            |" + " #{@azucares}g"
        puts "Camtidad de proteinas           |" + " #{@proteinas}g"
        puts "Camtidad de sal                 |" + " #{@sal}g"
    end
    
    # Define el metodo para compara elementos de tipo Nutricional_label
    #
    # == Parameters:
    # Recibe un parametro de tipo Nutricional_label
    #
    # == Returns:
    # Un balor booleano dependiendo del resultado de la operacion
    def <=>(other)
        energetic_value_Kcal <=> other.energetic_value_Kcal
    end
    
    # Indica la cantidad de sal que tiene el alimento
    #
    # == Parameters:
    # Recibe un parametro de tipo Nutricional_label
    #
    # == Returns:
    # Un string 
    def clasificar
        if @sal <= 1
            "poca" 
        elsif @sal > 1 and @sal <= 2
            "media"
        elsif @sal > 2
            "mucha"
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
    
        "#{@kcal}"
    
    end
    
end 
