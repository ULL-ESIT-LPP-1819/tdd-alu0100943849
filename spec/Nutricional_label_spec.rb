require 'spec_helper'

RSpec.describe Nutricional_label do
    it "has a version number" do
        expect(Nutrientes::VERSION).not_to be nil
    end
    
    before :each do
        @dll = DlinkedList.new()
        @alimento1 = Nutricional_label.new("etiqueta 1",11.0,22.0,24.0,23.0,5.7,1.1) #grasa,grasa_saturada,hid_carbono,azucares,proteinas,sal
        @alimento2 = Nutricional_label.new("etiqueta 2",9.0,14.0,31.0,36.0,6.9,0.75)
    end
    
#------------------------------------------------------------------------------------
    
    describe "# Debe existir un nombre para la etiqueta: " do
        it "existe un nombre" do
            expect(@alimento1.nombre_etiqueta).to eq("etiqueta 1")
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
#------------------------------------------------------------------------------------
    describe "# Nombre de la etiqueta: " do
        it "Existe un metodo para obtener el nombre" do
            expect(@alimento1.label_name).to eq("etiqueta 1")
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
            expect(@alimento1.to_s)
        end
    end
#------------------------------------------------------------------------------------    
    describe "# Dll vacia: " do
        it "head = nil." do
            expect(@dll.head).to eq(nil)
        end
        it "tail = nil." do
            expect(@dll.tail).to eq(nil)
        end
        it "current = nil." do
            expect(@dll.current).to eq(nil)
        end
    end 
    
    describe "# insertar un alimento: " do
        it "el alimento fue insertado por la cola." do
            @nodo_expect = Node.new(@alimento1)
            expect(@dll.insertTail(@alimento1)).to eq(@nodo_expect)
        end
         it "el alimento fue insertado por la cabeza." do
            @nodo_expect = Node.new(@alimento2)
            expect(@dll.insertHead(@alimento2)).to eq(@nodo_expect)
        end
    end
    
    
    
    
    
end
