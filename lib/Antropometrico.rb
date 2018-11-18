class Antropometrico
   
   attr_reader :peso, :talla, :edad, :sexo, :cintura, :cadera
   
    def initialize(peso,talla,edad,sexo,cintura,cadera)
       @peso = peso
       @talla = talla
       @edad = edad
       @sexo = sexo
       @cintura = cintura
       @cadera = cadera
    end
    
    def ICM
        @icm = @peso / (@talla * @talla)
        @icm.round(1)
    end
    
    def Porcentaje_grasa
        @resul = (1.2 * ( @peso / (@talla * @talla) )) + (0.23 * @edad) - (10.8 * @sexo) - 5.4
        @resul.round(2)
    end
    
    def RCC
        @rcc = (@cintura/@cadera)
        @rcc.round(2)
    end
    
    def to_s
        "#{@icm}"
        "#{@resul}"
        "#{@rcc}"
    end
end