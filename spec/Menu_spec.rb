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
            expect(@menu.tiempo_comida).to eq([])
        end
        
        it "existen un titulo" do
            expect(@menu.titulo_menu).to eq("Bajo en calorias")
        end
        
        it "existe desayuno" do
            expect(@menu.desayunos).to eq([])
        end
        
        it "existe comida" do
            expect(@menu.comidas).to eq([])
        end
        
        it "existe cena" do
            expect(@menu.cenas).to eq([])
        end
    
    end
    
end