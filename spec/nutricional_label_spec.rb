require 'lib/nutricional_label'

describe Nutricional_label do
    
    before :each do
        @datos = Nutricional_label.new("etiqueta 1",11.0,22.0,24.0,23.0,5.7,1.1) #grasa,grasa_saturada,hid_carbono,azucares,proteinas,sal
    end
    
    describe "# Debe existir un nombre para la etiqueta: " do
        it "existe un nombre" do
            expect(@datos.nombre_etiqueta).to eq("etiqueta 1")
        end
    end
    
    describe "# Debe existir la candidad de grasas: " do
        it "existe la candidad de grasa" do
            expect(@datos.grasa.nil?).to eq(false)  #espera que el valor de @datos.grasa.nil? sea falso, porque tiene un valor y no esta nula, si la variable esta nula nil es igual a true que es distinto de false y falla la prueba
        end
        it "existe la candidad de grasa saturadas" do
            expect(@datos.grasa_saturada.nil?).to eq(false)
        end
    end
    
    describe "# Debe existir la candidad de  hidratos de carbono: " do
        it "existe la candidad de hidratos de carbono" do
            expect(@datos.hid_carbono.nil?).to eq(false)
        end
        it "existe la candidad de azucares" do
            expect(@datos.azucares.nil?).to eq(false)
        end
    end
    
    describe "# Debe existir la candidad de proteinas: " do
        it "existe la candidad de proteinas" do
            expect(@datos.proteinas.nil?).to eq(false)
        end
    end
    
    describe "# Debe existir la candidad de sal: " do
        it "existe la candidad de sal" do
            expect(@datos.sal.nil?).to eq(false)
        end
    end
#------------------------------------------------------------------------------------
    describe "# Nombre de la etiqueta: " do
        it "Existe un metodo para obtener el nombre" do
            expect(@datos.label_name).to eq("etiqueta 1")
        end
    end
    
    describe "# Valor Energetico: " do
        it "Existe un metodo para obtener el valor energetio en KJ." do
            expect(@datos.energetic_value_KJ).to eq(2144.4)
        end
        it "Existe un metodo para obtener el valor energetioen Kcal." do
            expect(@datos.energetic_value_Kcal).to eq(514.4)
        end
    end
    
    describe "# candidad de grasas: " do
        it "Existe un metodo para obtener la cantidad de grasas" do
            expect(@datos.grasa).to eq(11.0)
        end
        it "Existe un metodo para obtener la cantidad de grasas saturadas" do
            expect(@datos.grasa_saturada).to eq(22.0)
        end
    end
    
    describe "# candidad de  hidratos de carbono: " do
        it "Existe un metodo para obtener la cantidad de hidratos de carbono" do
            expect(@datos.hid_carbono).to eq(24.0)
        end
        it "Existe un metodo para obtener la cantidad de azucares" do
            expect(@datos.azucares).to eq(23.0)
        end
    end
    
    describe "# candidad de proteinas: " do
        it "Existe un metodo para obtener la cantidad de proteinas" do
            expect(@datos.proteinas).to eq(5.7)
        end
    end
    
    describe "# candidad de sal: " do
        it "Existe un metodo para obtener la cantidad de sal" do
            expect(@datos.sal).to eq(1.1)
        end
    end
    
end