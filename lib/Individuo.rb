require 'nutrientes/version'
require 'Antropometrico'

class Individuo
    
    def initialize()
       
    end
    
    def datos_antropometricos
        
    end
    
end

class No_es_paciente < Individuo
    
end

class Es_pacientes < Individuo

end

class Paciente_obeso_en_tratamiento < Es_pacientes

end


class Paciente_no_en_tratamiento < Es_pacientes

end