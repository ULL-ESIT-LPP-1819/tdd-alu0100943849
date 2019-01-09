require 'spec_helper'
require 'benchmark'

RSpec.describe Menu do
    it "has a version number" do
        expect(Nutrientes::VERSION).not_to be nil
    end
    
    before :all do
        @menu = Menu.new("Lunes") do
            titulo      "Bajo en calorias"
            ingesta     :min => 30, 
                        :max => 35
            desayuno    :descripcion => "Pan de trigo integral",
                        :porcion => "1 rodaja",
                        :gramos => 100,
                        :grasas => 3.3,
                        :carbohidratos => 54.0,
                        :proteinas => 11.0,
                        :fibra => 2.3,
                        :sal => 0.06
            desayuno    :descripcion => "Actimel",
                        :porcion => "1 porcion",
                        :gramos => 100,
                        :grasas => 3.4,
                        :carbohidratos => 4.4,
                        :proteinas => 3.6,
                        :sal => 0.05
            comida      :descripcion => "Arroz",
                        :porcion => "1 taza",
                        :gramos => 100,
                        :grasas => 0.9,
                        :carbohidratos => 81.6,
                        :proteinas => 6.67,
                        :fibra => 1.4,
                        :sal => 0.04
            comida      :descripcion => "Lentejas",
                        :porcion => "1/2 cucharon",
                        :grasas => 0.4,
                        :carbohidratos => 20.0,
                        :proteinas => 9.0,
                        :fibra => 8.0,
                        :sal => 0.02
            comida      :descripcion => "Naranja",
                        :porcion => "1 pieza",
                        :gramos => 100,
                        :grasas => 0.12,
                        :carbohidratos => 11.75,
                        :proteinas => 0.94,
                        :fibra => 2.4
            cena        :descripcion => "Leche entera hacendado",
                        :porcion => "1 vaso",
                        :gramos => 100,
                        :grasas => 3.6,
                        :carbohidratos => 4.6,
                        :proteinas => 3.1,
                        :sal => 0.13
        end
    end
    
    describe "# Datos del menu:  " do
        
        
        it "existe un dia" do
            expect(@menu.dia).to eq("Lunes")
        end
        
        it "existen un tiempo de ingesta" do
            expect(@menu.tiempo_comida).to eq([" 30 35"])
        end
        
        it "existen un titulo" do
            expect(@menu.titulo_menu).to eq("Bajo en calorias")
        end
        
        it "existe desayunos" do
            expect(@menu.desayunos).not_to eq(nil)
        end
        
        it "valores de desayunos" do
            expect(@menu.desayunos).to eq([" \"Pan de trigo integral\" 1 rodaja 100 3.3 54.0 11.0  2.3 0.06", " \"Actimel\" 1 porcion 100 3.4 4.4 3.6   0.05"])
        end
        
        it "existe comidas" do
            expect(@menu.comidas).not_to eq(nil)
        end
        
        it "valores de comidas" do
            expect(@menu.comidas).to eq([" \"Arroz\" 1 taza 100 0.9 81.6 6.67  1.4 0.04", " \"Lentejas\" 1/2 cucharon  0.4 20.0 9.0  8.0 0.02", " \"Naranja\" 1 pieza 100 0.12 11.75 0.94  2.4 "])
        end
        
        it "existe cenas" do
            expect(@menu.cenas).not_to eq(nil)
        end
        
        it "valores de cenas" do
            expect(@menu.cenas).to eq([" \"Leche entera hacendado\" 1 vaso 100 3.6 4.6 3.1   0.13"])
        end
    
    end
    
end