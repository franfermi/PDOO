# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class Player
  att_reader :name, :combatLevels, :hiddenTreasures, :visibleTreasures, :levels, :name , :level, :dead,
    :canISteal, :MAXLEVEL, :pendinBadConsequence, :enemy
  @@MAXLEVEL=10    #como es de clase se inicializa fuera
 
   
  def initialize(name)
    @name=name
   end
   
  private def bringToLife
    @dead=false;
    
  end
  
  private def incrementLevels(l)
    @levels=@levels+l
  end
  
  private def decrementLevels(l )
    @levels=@levels-l
  end
  
  private def setPendingBadConsequence(b)
    @pendinBadConsequence=b
  end
  
  private def  applyPrize(m)

  end

  private def applyBadConsequence(m)

  end

  private def canMakeTreasureVisible(t)
    
    
  end

  private def howManyVisibleTreasures(tKind)
    @contador=0
    
      hiddenTreasures.each{ |h| 
        if h.type == tKind
          @contador=@ontador+1
        end
      }
      
    contador
  end

  private def dieIfNoTreasures
    if(hiddenTreasures.empty? && visibleTreasures.empty?)
          @dead=true;
    end
  end

  def isDead
    @dead
  end

  def combat(monster)

  end

  def makeTreasureVisible(treasure)

  end

  def discardVisibleTreasure(treasure)

  end

  def discardHiddenTreasure(teasure)

  end
  
  def validState() 
    
    valido=false;
       
     if @pendingBadConsequence == nil && @hiddenTreasures.lenght > 4
         valido=true;
     end 
     
      valido
       
  end
  
  def initTreasures()

  end
  
  def getLevels() 
    return @levels
  end
  
  def stealTreasure() 

  end
  
  def setEnemy( enemy)
    @enemy=enemy  

  end
  
  def giveMeATreasure() 

  end
  
  def canISteal() 
   robado=false
    
    if @hiddenTreasures.empty? && @visibleTreasures.empty?
      robado=true
     end
         
     return robado
  end

  private def canYouGiveMeATreasure()

      ser_robado=false;
      if visibleTreasures.size >0 || hiddenTreasures.size >0
         ser_robado=true;
     end
     return ser_robado
  end
  
  private def haveStole
    @canISteal=false
  end
  
  def discardAllTreasures
    
  end

end
