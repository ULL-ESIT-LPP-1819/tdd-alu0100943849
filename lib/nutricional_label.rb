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

end 
