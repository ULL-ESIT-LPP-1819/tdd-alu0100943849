require 'nutrientes/version'

class Nutricional_label

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
        (@grasa * 37) + (@grasa_saturada * 37) + (@hid_carbono * 17) + (@azucares * 17) + (@proteinas * 17) + (@sal * 25)
    end
    
    def energetic_value_Kcal
        (@grasa * 9) + (@grasa_saturada * 9) + (@hid_carbono * 4) + (@azucares * 4) + (@proteinas * 4) + (@sal * 6)
    end

    def to_s
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
    
end 
