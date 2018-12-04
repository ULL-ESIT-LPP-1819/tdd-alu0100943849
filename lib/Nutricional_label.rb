require 'nutrientes/version'
require 'DlinkedList'

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
    
    def label_name
        "#{@nombre_etiqueta}"
    end
    
    def energetic_value_KJ
        @kj = (@grasa * 37) + (@grasa_saturada * 37) + (@hid_carbono * 17) + (@azucares * 17) + (@proteinas * 17) + (@sal * 25)
    end
    
    def energetic_value_Kcal
        @kcal = (@grasa * 9) + (@grasa_saturada * 9) + (@hid_carbono * 4) + (@azucares * 4) + (@proteinas * 4) + (@sal * 6)
    end

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
    
    def <=>(other)
        energetic_value_Kcal <=> other.energetic_value_Kcal
    end
    
    def clasificar
        if @sal <= 1
            "poca" 
        elsif @sal > 1 and @sal <= 2
            "media"
        elsif @sal > 2
            "mucha"
        end
    end
    
    def to_s
    
        "#{@kcal}"
    
    end
    
end 
