# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.


class Monster
  
    attr_reader:name, :combatLevel, :bc, :pz
    
    def initialize(name , combatLevel, bc, pz)
    @name=name
    @combatLevel=combatLevel
    @bc=bc
    @pz=pz
    end
    
    def to_s
      puts " Nivel Combate: #{@combatLevel} \n Nombre: #{@name} \n   
      Bad Consequende #{@bc}  \n Prize #{@pz} \n\n  ------------------\n "
      
    end
    
    def getLevelsGained
    
    end
    
   def getTreasuresGained
     
   end
  
end
