# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

require_relative 'prize.rb'
require_relative 'bad_consequence.rb'


class Monster
  attr_reader:name, :combatLevel, :badConsequence, :prize
    
    def initialize(name , combatLevel, badConsequence, prize)
    @name=name
    @combatLevel=combatLevel
    @badConsequence=badConsequence
    @prize=prize
    end
    
    def to_s
      puts " Nivel Combate: #{@combatLevel} \n Nombre: #{@name} \n   
      Bad Consequence #{@badConsequence}  \n Prize #{@prize} \n\n  ------------------\n "
      
    end
    
    def getLevelsGained
    
    end
    
   def getTreasuresGained
      
   end
  
end
