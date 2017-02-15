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
    "Monster = #{@name}" +
      " CombatLevel = #{@combat_level}" +
      " Prize = #{@prize.to_s}" +
      " badConsequence = #{@badConsequence.to_s}"
   end
    
   def getLevelsGained
    
   end
    
   def getTreasuresGained
      
   end
  
end
