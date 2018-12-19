require 'spec_helper'
require 'benchmark'

#----------------------------------------pruebas para la etiquetas nutricionales--------------------------------------------

RSpec.describe Nutricional_label do
    it "has a version number" do
        expect(Nutrientes::VERSION).not_to be nil
    end
    
    before :all do
        @alimento1 = Nutricional_label.new("Palmera de chocolate",11.0,22.0,24.0,23.0,5.7,1.1) #grasa,grasa_saturada,hid_carbono,azucares,proteinas,sal
        @alimento2 = Nutricional_label.new("Galletas",9.0,14.0,31.0,36.0,6.9,0.75)
        @alimento3 = Nutricional_label.new("yogur de fresa",11.2,0.8,0.1,12.5,1.8,0.1)
        @alimento4 = Nutricional_label.new("Chuleta de cerdo",20.0,0.0,14.0,0.0,36.0,0.75)
        @alimento5 = Nutricional_label.new("Hamburguesa",20.0,11.0,35.0,8.0,26.9,2.75)
    end
    
#------------------------------------------------------------------------------------Pruebas para Nutricional_label
    
    describe "# Debe existir un nombre para la etiqueta: " do
        it "existe un nombre" do
            expect(@alimento1.nombre_etiqueta).to eq("Palmera de chocolate")
        end
    end
    
    describe "# Debe existir la candidad de grasas: " do
        it "existe la candidad de grasa" do
            expect(@alimento1.grasa.nil?).to eq(false)  #espera que el valor de @alimento1.grasa.nil? sea falso, porque tiene un valor y no esta nula, si la variable esta nula nil es igual a true que es distinto de false y falla la prueba
        end
        it "existe la candidad de grasa saturadas" do
            expect(@alimento1.grasa_saturada.nil?).to eq(false)
        end
    end
    
    describe "# Debe existir la candidad de  hidratos de carbono: " do
        it "existe la candidad de hidratos de carbono" do
            expect(@alimento1.hid_carbono.nil?).to eq(false)
        end
        it "existe la candidad de azucares" do
            expect(@alimento1.azucares.nil?).to eq(false)
        end
    end
    
    describe "# Debe existir la candidad de proteinas: " do
        it "existe la candidad de proteinas" do
            expect(@alimento1.proteinas.nil?).to eq(false)
        end
    end
    
    describe "# Debe existir la candidad de sal: " do
        it "existe la candidad de sal" do
            expect(@alimento1.sal.nil?).to eq(false)
        end
    end
    
    describe "# Nombre de la etiqueta: " do
        it "Existe un metodo para obtener el nombre" do
            expect(@alimento1.nombre_etiqueta).to eq("Palmera de chocolate")
        end
    end
    
    describe "# Valor Energetico: " do
        it "Existe un metodo para obtener el valor energetio en KJ." do
            expect(@alimento1.energetic_value_KJ).to eq(2144.4)
        end
        it "Existe un metodo para obtener el valor energetioen Kcal." do
            expect(@alimento1.energetic_value_Kcal).to eq(514.4)
        end
    end
    
    describe "# candidad de grasas: " do
        it "Existe un metodo para obtener la cantidad de grasas" do
            expect(@alimento1.grasa).to eq(11.0)
        end
        it "Existe un metodo para obtener la cantidad de grasas saturadas" do
            expect(@alimento1.grasa_saturada).to eq(22.0)
        end
    end
    
    describe "# candidad de  hidratos de carbono: " do
        it "Existe un metodo para obtener la cantidad de hidratos de carbono" do
            expect(@alimento1.hid_carbono).to eq(24.0)
        end
        it "Existe un metodo para obtener la cantidad de azucares" do
            expect(@alimento1.azucares).to eq(23.0)
        end
    end
    
    describe "# candidad de proteinas: " do
        it "Existe un metodo para obtener la cantidad de proteinas" do
            expect(@alimento1.proteinas).to eq(5.7)
        end
    end
    
    describe "# candidad de sal: " do
        it "Existe un metodo para obtener la cantidad de sal" do
            expect(@alimento1.sal).to eq(1.1)
        end
    end
    
    describe "# etiqueta: " do
        it "Existe un metodo para obtener la etiqueta formateada" do
            expect(@alimento1.print_label)
        end
    end
end
#----------------------------------------pruebas para la lista doblemente enlazada--------------------------------------------
RSpec.describe DlinkedList do
    it "has a version number" do
        expect(Nutrientes::VERSION).not_to be nil
    end
    
    before :all do
        @dll = DlinkedList.new()
        @alimento1 = Nutricional_label.new("Palmera de chocolate",11.0,22.0,24.0,23.0,5.7,1.1) #grasa,grasa_saturada,hid_carbono,azucares,proteinas,sal
        @alimento2 = Nutricional_label.new("Galletas",9.0,14.0,31.0,36.0,6.9,0.75)
        @alimento3 = Nutricional_label.new("yogur de fresa",11.2,0.8,0.1,12.5,1.8,0.1)
        @alimento4 = Nutricional_label.new("Chuleta de cerdo",20.0,0.0,14.0,0.0,36.0,0.75)
        @alimento5 = Nutricional_label.new("Hamburguesa",20.0,11.0,35.0,8.0,26.9,2.75)
    end
    
    describe "# Dll vacia: " do
        it "head = nil." do
            expect(@dll.head).to eq(nil)
        end
        it "tail = nil." do
            expect(@dll.tail).to eq(nil)
        end
    end
    
    describe "# insertar un alimento: " do
        it "comprobar que head y tail apunta al mismo nodo." do
            @dll.insertHead(@alimento1)
            expect(@dll.head.value).to eq(@alimento1)
            expect(@dll.tail.value).to eq(@alimento1)
        end
        it "Introducir mas alimentos" do
            @dll.insertTail(@alimento2)
            expect(@dll.tail.value).to eq(@alimento2)
            @dll.insertTail(@alimento3)
            expect(@dll.tail.value).to eq(@alimento3)
            @dll.insertTail(@alimento4)
            expect(@dll.tail.value).to eq(@alimento4)
            @dll.insertTail(@alimento5)
            expect(@dll.tail.value).to eq(@alimento5)
        end
    end
    
    describe "# cantidad de sal: " do
        it "poca sal" do
           expect(@alimento2.clasificar).to eq("poca")
           expect(@alimento3.clasificar).to eq("poca")
           expect(@alimento4.clasificar).to eq("poca")
        end
        it "cantidad justa de sal" do
           expect(@alimento1.clasificar).to eq("media")
        end
        it "mucha sal" do
           expect(@alimento5.clasificar).to eq("mucha")
        end
    end
    
    describe "# extraer un alimento: " do
        it "eliminar el ultimo alimento de la lista." do
          expect(@dll.popTail.value).to eq(@alimento5)
        end
        it "eliminar el primer alimento de la list." do
          expect(@dll.popHead.value).to eq(@alimento1)
        end
        it "Eliminar todos los alimento existente en la lista." do
          expect(@dll.removeAll).to eq(nil)
        end
        it "Eliminar un alimento inexistente de la lista." do
          expect(@dll.head).to eq(nil)
        end
    end
end
#----------------------------------------pruebas de herencia de individuos--------------------------------------------
RSpec.describe Individuo do
    it "has a version number" do
        expect(Nutrientes::VERSION).not_to be nil
    end
    
    before :all do
        @dll = DlinkedList.new()
        @alimento1 = Nutricional_label.new("Palmera de chocolate",11.0,22.0,24.0,23.0,5.7,1.1) #grasa,grasa_saturada,hid_carbono,azucares,proteinas,sal
        @alimento2 = Nutricional_label.new("Galletas",9.0,14.0,31.0,36.0,6.9,0.75)
        @alimento3 = Nutricional_label.new("yogur de fresa",11.2,0.8,0.1,12.5,1.8,0.1)
        @alimento4 = Nutricional_label.new("Chuleta de cerdo",20.0,0.0,14.0,0.0,36.0,0.75)
        @alimento5 = Nutricional_label.new("Hamburguesa",20.0,11.0,35.0,8.0,26.9,2.75)
    end
    describe "# Herencia: " do
        before :each do
            @persona = Individuo.new("Mario Perez")
            @paciente = Pacientes.new("Pepe Garcia", nil, nil)
        end  
        it "una objeto persona es una instancia de la clase Individuo" do
            expect(@persona).to be_an_instance_of(Individuo::Individuo)
        end
        it "una persona pertenece a la clase Individuo" do
          expect(@persona).is_a? Individuo
        end
        it "una persona pertenece a la clase Object" do
           expect(@persona).is_a? Object
        end
        it "una persona pertenece a la clase BasicObject" do
           expect(@persona).is_a? BasicObject
        end
        it "una objeto paciente es una instancia de la clase Pacientes" do
            expect(@paciente).to be_an_instance_of(Pacientes::Pacientes)
        end
        it "una paciente pertenece a la clase Pacientes" do
          expect(@paciente).is_a? Pacientes
        end
        it "una paciente pertenece a la clase Individuo" do
          expect(@paciente).is_a? Individuo
        end
        it "una paciente pertenece a la clase Object" do
           expect(@paciente).is_a? Object
        end
        it "una persopacientena pertenece a la clase BasicObject" do
           expect(@paciente).is_a? BasicObject
        end
    end
    
    describe "# Tipo: " do
        before :each do
          @persona = Individuo.new("Mario Perez")
          @paciente = Pacientes.new("Pepe Garcia", nil, nil)
        end
        it "un objeto persona responde al método nombre" do
           expect(@persona).to respond_to(:nombre)
        end
        it "un objeto persona responde al método .es" do
           expect(@persona).to respond_to('es') 
        end
        it "un objeto paciente responde al método nombre y datos" do
           expect(@paciente).to respond_to(:nombre, :datos) 
        end
        it "un objeto persona responde al método indice_corporal" do
           expect(@paciente).to respond_to('indice_corporal') 
        end
        it "un objeto persona responde al método .es de la clase individuo" do
           expect(@paciente).to respond_to('es') 
        end
    end
 
    describe "# Clasificacion por imc: " do
        before :all do
            @persona = Individuo.new("Mario Perez")
            
            @paciente1 = Pacientes.new("Pepe Garcia", @datos1 = Antropometrico.new(1, 76,1.75,22,84.0,89.0), nil)
            @paciente2 = Pacientes.new("Juas Perez", @datos2 = Antropometrico.new(1, 90.4, 1.80, 34, 120.0, 115.6), nil)
            @paciente3 = Pacientes.new("Begoña Gomez", @datos3 = Antropometrico.new(0, 49.6, 1.60, 48, 45.0, 50.0), nil)
            @paciente4 = Pacientes.new("Luis Medina", @datos4 = Antropometrico.new(0, 120.2, 1.70, 28, 193.7, 193.5), nil)
            @paciente5 = Pacientes.new("Maria Perez", @datos5 = Antropometrico.new(0, 120.2, 1.90, 31, 193.7, 193.5), nil)
            
            @lista_pacientes = DlinkedList.new()
            @lista_pacientes.insertTail(@paciente1)
            @lista_pacientes.insertTail(@paciente2)
            @lista_pacientes.insertTail(@paciente3)
            @lista_pacientes.insertTail(@paciente4)
            @lista_pacientes.insertTail(@paciente5)
        end
        it "comprobacion de si un individuo cualquiera es paciente" do
           expect(@persona.es @paciente1).to eq(false) #Mario Perez no es Pepe Garcia
        end
        it "ICM: Peso adecuado" do
           expect(@lista_pacientes.head.value.indice_corporal).to eq("Peso adecuado")
           @lista_pacientes.popHead
        end
        it "ICM: Sobrepeso" do
           expect(@lista_pacientes.head.value.indice_corporal).to eq("Sobrepeso")
           @lista_pacientes.popHead
        end
        it "ICM: Peso adecuado" do
            expect(@lista_pacientes.head.value.indice_corporal).to eq("Peso adecuado")
           @lista_pacientes.popHead
        end
         it "ICM: Obesidad grado 3" do
           expect(@lista_pacientes.head.value.indice_corporal).to eq("Obesidad grado 3")
           @lista_pacientes.popHead
        end
        it "ICM: Obesidad grado 1" do
           expect(@lista_pacientes.head.value.indice_corporal).to eq("Obesidad grado 1")
           @lista_pacientes.popHead
        end
    end
end
#------------------------------------------pruebas comparable----------------------------------------------
RSpec.describe Comparable do
    it "has a version number" do
        expect(Nutrientes::VERSION).not_to be nil
    end
    
    describe "# Comparar Valor Energetico de las etiquetas de informacion nutricional: " do
        before :each do
            @alimento1 = Nutricional_label.new("Palmera de chocolate",11.0,22.0,24.0,23.0,5.7,1.1) #grasa,grasa_saturada,hid_carbono,azucares,proteinas,sal
            @alimento2 = Nutricional_label.new("Galletas",9.0,14.0,31.0,36.0,6.9,0.75)
            @alimento3 = Nutricional_label.new("yogur de fresa",11.2,0.8,0.1,12.5,1.8,0.1)
            @alimento4 = Nutricional_label.new("Chuleta de cerdo",20.0,0.0,14.0,0.0,36.0,0.75)
            @alimento5 = Nutricional_label.new("Hamburguesa",20.0,11.0,35.0,8.0,26.9,2.75)
            @alimento6 = Nutricional_label.new("rosquillas",9.0,14.0,31.0,36.0,6.9,0.75)
        end
        it "comparacion por Kcal mediante <=>." do
            expect(@alimento1 <=> @alimento5).to eq(-1)
        end
        it "comparacion por Kcal mediante <." do
            expect(@alimento3 < @alimento4).to eq(true)
        end
        it "comparacion por Kcal mediante >." do
            expect(@alimento3 > @alimento5).to eq(false)
        end
        it "comparacion por Kcal mediante ==." do
            expect(@alimento2 == @alimento6).to eq(true)
        end
        it "comparacion por Kcal mediante >=." do
            expect(@alimento6 >= @alimento2).to eq(true)
        end
        it "comparacion por Kcal mediante <=." do
            expect(@alimento3 <= @alimento4).to eq(true)
        end
        it "comparacion por Kcal
        mediante between?." do
            expect(@alimento4.between?(@alimento3, @alimento5)).to eq(true)
        end
    end
    
    describe "# Comparar la valoracion nutricional de los individuos: " do
        before :all do
            @datos1 = Antropometrico.new(1, 76,1.75,22,84.0,89.0)
            @datos2 = Antropometrico.new(1, 90.4, 1.80, 34, 120.0, 115.6)
            @datos3 = Antropometrico.new(0, 49.6, 1.60, 48, 45.0, 50.0)
            @datos4 = Antropometrico.new(0, 120.2, 1.70, 28, 193.7, 193.5)
            @datos5 = Antropometrico.new(0, 120.2, 1.90, 31, 193.7, 193.5)
        end
        it "comparacion mediante <=>." do
            expect(@datos1 <=> @datos3).to eq(1)
        end
        it "comparacion mediante <." do
            expect(@datos3 < @datos5).to eq(true)
        end
        it "comparacion mediante >." do
            expect(@datos1 > @datos2).to eq(false)
        end
        it "comparacion mediante ==." do
            expect(@datos3 == @datos3).to eq(true)
        end
        it "comparacion mediante >=." do
            expect(@datos5 >= @datos3).to eq(true)
        end
        it "comparacion mediante <=." do
            expect(@datos3 <= @datos5).to eq(true)
        end
        it "comparacion mediante between?." do
            expect(@datos4.between?(@datos3, @datos5)).to eq(false)
        end
    end
    
end
#--------------------------------------------pruebas enumerable-------------------------------------------
RSpec.describe Enumerable do
    it "has a version number" do
        expect(Nutrientes::VERSION).not_to be nil
    end
    
    
    
     describe "# Enumerar listas de etiquetas de informacion nutricional: " do
        before :all do
            @alimento1 = Nutricional_label.new("Palmera de chocolate",11.0,22.0,24.0,23.0,5.7,1.1) #grasa,grasa_saturada,hid_carbono,azucares,proteinas,sal
            @alimento2 = Nutricional_label.new("Galletas",9.0,14.0,31.0,36.0,6.9,0.75)
            @alimento3 = Nutricional_label.new("yogur de fresa",11.2,0.8,0.1,12.5,1.8,0.1)
            @alimento4 = Nutricional_label.new("Chuleta de cerdo",20.0,0.0,14.0,0.0,36.0,0.75)
            @alimento5 = Nutricional_label.new("Hamburguesa",20.0,11.0,35.0,8.0,26.9,2.75)
            
            @lista_alimentos = DlinkedList.new()
            @lista_alimentos.insertTail(@alimento1)
            @lista_alimentos.insertTail(@alimento2)
            @lista_alimentos.insertTail(@alimento3)
            @lista_alimentos.insertTail(@alimento4)
            @lista_alimentos.insertTail(@alimento5)
        end
         
       it "collect" do
            expect(@lista_alimentos.collect { |lista_alimentos| lista_alimentos}).to eq([@alimento1, @alimento2, @alimento3, @alimento4, @alimento5])
        end
        it "select" do
            expect(@lista_alimentos.select { |lista_alimentos| lista_alimentos.clasificar == "poca"}).to eq([@alimento2, @alimento3, @alimento4])
        end
        it "max" do
            expect(@lista_alimentos.max { |alimento1, alimento5| alimento1.clasificar <=> alimento5.clasificar }).to eq(@alimento2)
        end 
        it "min" do
            expect(@lista_alimentos.min { |alimento1, alimento5| alimento1.clasificar <=> alimento5.clasificar }).to eq(@alimento1)
        end
         it "sort" do
            expect(@lista_alimentos.sort  {|alimento1, alimento5| alimento1.clasificar <=> alimento5.clasificar }).to eq([@alimento1, @alimento5, @alimento2, @alimento3, @alimento4])
        end
    end
    
    describe "# Enumerar listas de valoraciones nutricionales de individuos: " do
        before :all do
            
            @paciente1 = Pacientes.new("Pepe Garcia", @datos1 = Antropometrico.new(1, 76,1.75,22,84.0,89.0), nil)
            @paciente2 = Pacientes.new("Juas Perez", @datos2 = Antropometrico.new(1, 90.4, 1.80, 34, 120.0, 115.6), nil)
            @paciente3 = Pacientes.new("Begoña Gomez", @datos3 = Antropometrico.new(0, 49.6, 1.60, 48, 45.0, 50.0), nil)
            @paciente4 = Pacientes.new("Luis Medina", @datos4 = Antropometrico.new(0, 120.2, 1.70, 28, 193.7, 193.5), nil)
            @paciente5 = Pacientes.new("Maria Perez", @datos5 = Antropometrico.new(0, 120.2, 1.90, 31, 193.7, 193.5), nil)
            
            @lista_pacientes = DlinkedList.new()
            @lista_pacientes.insertTail(@paciente1)
            @lista_pacientes.insertTail(@paciente2)
            @lista_pacientes.insertTail(@paciente3)
            @lista_pacientes.insertTail(@paciente4)
            @lista_pacientes.insertTail(@paciente5)
            
        end
        it "collect" do
            expect(@lista_pacientes.collect { |lista_pacientes| lista_pacientes.to_s}).to eq(["24.8", "27.9", "19.4", "41.6", "33.3"])
        end
        it "select" do
            expect(@lista_pacientes.select { |lista_pacientes| lista_pacientes.to_s == "24.8"}).to eq([@paciente1])
        end
        it "max" do
            expect(@lista_pacientes.max { |paciente1, paciente5| paciente1.datos.indice_masa_corporal <=> paciente5.datos.indice_masa_corporal }).to eq(@paciente4)
        end 
        it "min" do
            expect(@lista_pacientes.min { |paciente1, paciente5| paciente1.datos.indice_masa_corporal <=> paciente5.datos.indice_masa_corporal }).to eq(@paciente3)
        end
        it "sort" do
            expect(@lista_pacientes.sort  {|paciente1, paciente5| paciente1.datos.indice_masa_corporal <=> paciente5.datos.indice_masa_corporal }).to eq([@paciente3, @paciente1, @paciente2, @paciente5, @paciente4])
        end
    end
end
#--------------------------------------------pruebas pacientes-------------------------------------------
RSpec.describe Pacientes do
    it "has a version number" do
        expect(Nutrientes::VERSION).not_to be nil
    end
    
    describe "# indicadores energeticos del individuo: " do
        before :all do
            @paciente1 = Pacientes.new("Pepe Garcia", @datos1 = Antropometrico.new(1, 76,1.75,22,84.0,89.0), "moderada")
        end
        it "actividad fisica" do
            expect(@paciente1.actividad_fisica).to eq("moderada")
        end
        it "peso teorico ideal" do
            expect(@paciente1.peso_teorico_ideal).to eq(68.75)
        end
        it "efecto termogeno" do
            expect(@paciente1.efecto_termogeno).to eq(66.59375)
        end
        it "gasto actividad fisica" do
            expect(@paciente1.gasto_actividad_fisica).to eq(179.80312500000002)
        end
        it "gasto energetico total" do
            expect(@paciente1.gasto_energetico_total).to eq(912.334375)
        end
    end
    
    describe "# Gasto energetico total del individuo: " do
        before :all do
            
            #grasa,grasa_saturada,hid_carbono,azucares,proteinas,sal
            @alimento1 = Nutricional_label.new("1",11.0,22.0,24.0,23.0,5.7,1.1) 
            @alimento2 = Nutricional_label.new("2",9.0,14.0,31.0,36.0,6.9,0.75)
            @alimento3 = Nutricional_label.new("3",11.2,0.8,0.1,12.5,1.8,0.1)
            @alimento4 = Nutricional_label.new("4",1.0,0.0,14.0,0.0,36.0,0.75)
            @alimento5 = Nutricional_label.new("5",15.0,11.0,35.0,8.0,26.9,2.75)
            @alimento6 = Nutricional_label.new("6",12.4, 5.3, 35.0, 7.0, 4.6, 1.75)
            @alimento7 = Nutricional_label.new("7",0.2,0.0,6.8,4.7,0.9,0.17)
            @alimento8 = Nutricional_label.new("8",54.1,0.0,5.36,0.0,18.71,0.5)
            @alimento9 = Nutricional_label.new("9",0.7,0.2,1.6,0.0,6.67,0.75)
            @alimento10 = Nutricional_label.new("10",1.8,0.4,77.0,1.0,7.5,0.02)
            
            
            #  @alimento1 = Nutricional_label.new("Palmera de chocolate",11.0,22.0,24.0,23.0,5.7,1.1) 
            # @alimento2 = Nutricional_label.new("Galletas",9.0,14.0,31.0,36.0,6.9,0.75)
            # @alimento3 = Nutricional_label.new("yogur",11.2,0.8,0.1,12.5,1.8,0.1)
            # @alimento4 = Nutricional_label.new("Chuleta de cerdo",1.0,0.0,14.0,0.0,36.0,0.75)
            # @alimento5 = Nutricional_label.new("Hamburguesa",15.0,11.0,35.0,8.0,26.9,2.75)
            # @alimento6 = Nutricional_label.new("Pizza",12.4, 5.3, 35.0, 7.0, 4.6, 1.75)
            # @alimento7 = Nutricional_label.new("Ensalada",0.2,0.0,6.8,4.7,0.9,0.17)
            # @alimento8 = Nutricional_label.new("Almendras",54.1,0.0,5.36,0.0,18.71,0.5)
            # @alimento9 = Nutricional_label.new("Arroz",0.7,0.2,1.6,0.0,6.67,0.75)
            # @alimento10 = Nutricional_label.new("Pasta",1.8,0.4,77.0,1.0,7.5,0.02)
            
            @lista_alimentos1 = [@alimento1, @alimento2, @alimento3, @alimento5, @alimento4]
            @lista_alimentos2 = [@alimento6, @alimento7, @alimento8, @alimento9, @alimento10]
            @lista_alimentos3 = [@alimento1, @alimento7, @alimento3, @alimento2, @alimento5]
            @lista_alimentos4 = [@alimento7, @alimento1, @alimento7, @alimento4, @alimento7]
            @lista_alimentos5 = [@alimento3, @alimento4, @alimento7, @alimento1, @alimento8]
            @lista_alimentos6 = [@alimento1, @alimento4, @alimento4, @alimento5, @alimento4]
            @lista_alimentos7 = [@alimento6, @alimento6, @alimento8, @alimento9, @alimento10]
            @lista_alimentos8 = [@alimento1, @alimento8, @alimento3, @alimento2, @alimento5]
            @lista_alimentos9 = [@alimento7, @alimento4, @alimento7, @alimento4, @alimento7]
            @lista_alimentos10 = [@alimento3, @alimento4, @alimento7, @alimento4, @alimento4]
            
            @paciente1 = Pacientes.new("Pepe Garcia", @datos1 = Antropometrico.new(1, 76,1.75,22,84.0,89.0), "moderada")
            @paciente2 = Pacientes.new("Juas Perez", @datos2 = Antropometrico.new(1, 90.4, 1.80, 34, 120.0, 115.6), "reposo")
            @paciente3 = Pacientes.new("Begoña Gomez", @datos3 = Antropometrico.new(0, 49.6, 1.60, 48, 45.0, 50.0), "ligera")
            @paciente4 = Pacientes.new("Luis Medina", @datos4 = Antropometrico.new(0, 120.2, 1.70, 28, 193.7, 193.5), "intensa")
            @paciente5 = Pacientes.new("Maria Perez", @datos5 = Antropometrico.new(0, 120.2, 1.90, 31, 193.7, 193.5), "moderada")
            
            @lista_menu = [@lista_alimentos1,  @lista_alimentos2, @lista_alimentos3, @lista_alimentos4, @lista_alimentos5, @lista_alimentos6,  @lista_alimentos7, @lista_alimentos8, @lista_alimentos9, @lista_alimentos10]
            
            @paciente1 = Pacientes.new("Pepe Garcia", @datos1 = Antropometrico.new(1, 76,1.75,22,84.0,89.0), "moderada")
            @paciente2 = Pacientes.new("Juas Perez", @datos2 = Antropometrico.new(1, 90.4, 1.80, 34, 120.0, 115.6), "reposo")
            @paciente3 = Pacientes.new("Begoña Gomez", @datos3 = Antropometrico.new(0, 49.6, 1.60, 48, 45.0, 50.0), "ligera")
            @paciente4 = Pacientes.new("Luis Medina", @datos4 = Antropometrico.new(0, 120.2, 1.70, 28, 193.7, 193.5), "intensa")
            @paciente5 = Pacientes.new("Maria Perez", @datos5 = Antropometrico.new(0, 120.2, 1.90, 31, 193.7, 193.5), "moderada")
            @paciente6 = Pacientes.new("aaa", @datos1 = Antropometrico.new(1, 65,1.45,15,68.0,69.0), "moderada")
            @paciente7 = Pacientes.new("bbb", @datos2 = Antropometrico.new(1, 64.4, 1.66, 55, 82.0, 86.6), "reposo")
            @paciente8 = Pacientes.new("ccc", @datos3 = Antropometrico.new(0, 49.6, 1.65, 48, 100.0, 109.0), "ligera")
            @paciente9 = Pacientes.new("ddd", @datos4 = Antropometrico.new(1, 120.2, 1.90, 44, 154.7, 162.5), "intensa")
            @paciente10 = Pacientes.new("eee", @datos5 = Antropometrico.new(0, 45.2, 1.15, 10, 35.7, 39.5), "moderada")
            
            @lista_pacientes = DlinkedList.new()
            @lista_pacientes.insertTail(@paciente1)
            @lista_pacientes.insertTail(@paciente2)
            @lista_pacientes.insertTail(@paciente3)
            @lista_pacientes.insertTail(@paciente4)
            @lista_pacientes.insertTail(@paciente5)
            @lista_pacientes.insertTail(@paciente6)
            @lista_pacientes.insertTail(@paciente7)
            @lista_pacientes.insertTail(@paciente8)
            @lista_pacientes.insertTail(@paciente9)
            @lista_pacientes.insertTail(@paciente10)
            
            @lista_de_pacientes = DlinkedList.new()
            @lista_de_pacientes.insertTail(@paciente1)
            @lista_de_pacientes.insertTail(@paciente2)
            @lista_de_pacientes.insertTail(@paciente3)
            @lista_de_pacientes.insertTail(@paciente4)
            @lista_de_pacientes.insertTail(@paciente5)
            
        end
        it "pacientes a los que el menu 1 les vale" do
            #expect(@lista_alimentos1.reduce(0) {|sum, val_ener| sum + val_ener.energetic_value_Kcal }).to be_between(@paciente1.gasto_energetico_total-(@paciente1.gasto_energetico_total*0.1), @paciente1.gasto_energetico_total+(@paciente1.gasto_energetico_total*0.1)).inclusive
            #expect(@lista_alimentos1.reduce(0) {|sum, val_ener| sum + val_ener.energetic_value_Kcal }).to be_within(900).of(1003.5)
            expect(@lista_de_pacientes.select { |lista_de_pacientes| lista_de_pacientes.gasto_energetico_total <= @lista_alimentos1.reduce(0) {|sum, val_ener| sum + val_ener.energetic_value_Kcal }}).to eq([@paciente1, @paciente2, @paciente3, @paciente4, @paciente5])
        end
        it "pacientes a los que el menu 2 les vale" do
            expect(@lista_de_pacientes.select { |lista_de_pacientes| lista_de_pacientes.gasto_energetico_total <= @lista_alimentos2.reduce(0) {|sum, val_ener| sum + val_ener.energetic_value_Kcal }}).to eq([@paciente1, @paciente2, @paciente3, @paciente5])
        end
        it "pacientes a los que el menu 3 les vale" do
            expect(@lista_de_pacientes.select { |lista_de_pacientes| lista_de_pacientes.gasto_energetico_total <= @lista_alimentos3.reduce(0) {|sum, val_ener| sum + val_ener.energetic_value_Kcal }}).to eq([@paciente1, @paciente2, @paciente3, @paciente4, @paciente5])
        end
        it "pacientes a los que el menu 4 les vale" do
            expect(@lista_de_pacientes.select { |lista_de_pacientes| lista_de_pacientes.gasto_energetico_total <= @lista_alimentos4.reduce(0) {|sum, val_ener| sum + val_ener.energetic_value_Kcal }}).to eq([@paciente2, @paciente3])
        end
        it "pacientes a los que el menu 5 les vale" do
            expect(@lista_de_pacientes.select { |lista_de_pacientes| lista_de_pacientes.gasto_energetico_total <= @lista_alimentos5.reduce(0) {|sum, val_ener| sum + val_ener.energetic_value_Kcal }}).to eq([@paciente1, @paciente2, @paciente3, @paciente4, @paciente5])
        end
        
        
        Benchmark.bm do |x|
            n = 1000
            it "for dll" do
                x.report("for:") { n.times do expect(@lista_pacientes.ordenarFor).to eq([@paciente3, @paciente8, @paciente10, @paciente7, @paciente6, @paciente2, @paciente1, @paciente5, @paciente4, @paciente9]) end }
                # expect(@lista_pacientes.ordenarFor).to eq([@paciente3, @paciente8, @paciente10, @paciente7, @paciente6, @paciente2, @paciente1, @paciente5, @paciente4, @paciente9])
            end
            
            it "Each dll" do
                x.report("each:") {n.times do expect(@lista_pacientes.ordenarEach).to eq([@paciente3, @paciente8, @paciente10, @paciente7, @paciente6, @paciente2, @paciente1, @paciente5, @paciente4, @paciente9]) end}
            end
            
            it "sort dll" do
                x.report("sort:") {n.times do expect(@lista_pacientes.sort).to eq([@paciente3, @paciente8, @paciente10, @paciente7, @paciente6, @paciente2, @paciente1, @paciente5, @paciente4, @paciente9]) end}
            end
        end
        
        
        Benchmark.bm do |x|
            n = 1000
            it "each array" do
                x.report("each:") { n.times do expect(ordenarArrayEach(@lista_menu)).to eq([@lista_alimentos9, @lista_alimentos10, @lista_alimentos4, @lista_alimentos2, @lista_alimentos5, @lista_alimentos6,  @lista_alimentos7, @lista_alimentos3, @lista_alimentos1, @lista_alimentos8]) end}
            end
            
            it "for array" do
                x.report("for:") { n.times do expect(ordenarArrayFor(@lista_menu)).to eq([@lista_alimentos9, @lista_alimentos10, @lista_alimentos4, @lista_alimentos2, @lista_alimentos5, @lista_alimentos6,  @lista_alimentos7, @lista_alimentos3, @lista_alimentos1, @lista_alimentos8]) end}
            end
            
            
            it "sort array" do
                x.report("sort:") { n.times do expect(@lista_menu.sort { |menus| menus.reduce(0) {|sum, val_ener| sum + val_ener.energetic_value_Kcal}}).to eq([@lista_alimentos10, @lista_alimentos9, @lista_alimentos8, @lista_alimentos7, @lista_alimentos6, @lista_alimentos5, @lista_alimentos4, @lista_alimentos3, @lista_alimentos2, @lista_alimentos1]) end}
            end
        end
        
    end
    
    RSpec.describe Nutricional_label do
       before :all do
           
            @alimento1 = Nutricional_label.new("Palmera de chocolate",11.0,22.0,24.0,23.0,5.7,1.1) 
            @alimento2 = Nutricional_label.new("Galletas",9.0,14.0,31.0,36.0,6.9,0.75)
            @alimento3 = Nutricional_label.new("yogur",11.2,0.8,0.1,12.5,1.8,0.1)
            @alimento4 = Nutricional_label.new("Chuleta de cerdo",1.0,0.0,14.0,0.0,36.0,0.75)
            @alimento5 = Nutricional_label.new("Hamburguesa",15.0,11.0,35.0,8.0,26.9,2.75)
            @alimento6 = Nutricional_label.new("Pizza",12.4, 5.3, 35.0, 7.0, 4.6, 1.75)
            @alimento7 = Nutricional_label.new("Ensalada",0.2,0.0,6.8,4.7,0.9,0.17)
            @alimento8 = Nutricional_label.new("Almendras",54.1,0.0,5.36,0.0,18.71,0.5)
            @alimento9 = Nutricional_label.new("Arroz",0.7,0.2,1.6,0.0,6.67,0.75)
            @alimento10 = Nutricional_label.new("Pasta",1.8,0.4,77.0,1.0,7.5,0.02)
            
            @lista_alimentos1 = [@alimento1, @alimento2, @alimento3, @alimento5, @alimento4]
            @lista_alimentos2 = [@alimento6, @alimento7, @alimento8, @alimento9, @alimento10]
            @lista_alimentos3 = [@alimento1, @alimento7, @alimento3, @alimento2, @alimento5]
            @lista_alimentos4 = [@alimento7, @alimento1, @alimento7, @alimento4, @alimento7]
            @lista_alimentos5 = [@alimento3, @alimento4, @alimento7, @alimento1, @alimento8]
           
            @lista_menu = [@lista_alimentos1,  @lista_alimentos2, @lista_alimentos3, @lista_alimentos4, @lista_alimentos5, @lista_alimentos1,  @lista_alimentos2, @lista_alimentos3, @lista_alimentos4, @lista_alimentos5]
           
            @paciente1 = Pacientes.new("Pepe Garcia", @datos1 = Antropometrico.new(1, 76,1.75,22,84.0,89.0), "moderada")
            @paciente2 = Pacientes.new("Juas Perez", @datos2 = Antropometrico.new(1, 90.4, 1.80, 34, 120.0, 115.6), "reposo")
            @paciente3 = Pacientes.new("Begoña Gomez", @datos3 = Antropometrico.new(0, 49.6, 1.60, 48, 45.0, 50.0), "ligera")
            @paciente4 = Pacientes.new("Luis Medina", @datos4 = Antropometrico.new(0, 120.2, 1.70, 28, 193.7, 193.5), "intensa")
            @paciente5 = Pacientes.new("Maria Perez", @datos5 = Antropometrico.new(0, 120.2, 1.90, 31, 193.7, 193.5), "moderada")
            @paciente6 = Pacientes.new("aaa", @datos1 = Antropometrico.new(1, 65,1.45,15,68.0,69.0), "moderada")
            @paciente7 = Pacientes.new("bbb", @datos2 = Antropometrico.new(1, 64.4, 1.66, 55, 82.0, 86.6), "reposo")
            @paciente8 = Pacientes.new("ccc", @datos3 = Antropometrico.new(0, 49.6, 1.60, 48, 100.0, 109.0), "ligera")
            @paciente9 = Pacientes.new("ddd", @datos4 = Antropometrico.new(1, 120.2, 1.90, 44, 154.7, 162.5), "intensa")
            @paciente10 = Pacientes.new("eee", @datos5 = Antropometrico.new(0, 45.2, 1.15, 10, 35.7, 39.5), "moderada")
            
            @lista_de_pacientes = new DlinkedList()
            @lista_de_pacientes.insertTail(@paciente1)
            @lista_de_pacientes.insertTail(@paciente2)
            @lista_de_pacientes.insertTail(@paciente3)
            @lista_de_pacientes.insertTail(@paciente4)
            @lista_de_pacientes.insertTail(@paciente5)
            @lista_de_pacientes.insertTail(@paciente6)
            @lista_de_pacientes.insertTail(@paciente7)
            @lista_de_pacientes.insertTail(@paciente8)
            @lista_de_pacientes.insertTail(@paciente9)
            @lista_de_pacientes.insertTail(@paciente10)
           
        end
        it "ordena for" do
            expect(@lista_de_pacientes.ordenar).to eq(nil)
        end
        
        
        
        
    end
    
end