# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
 
  require_relative 'combat_result'
  require_relative 'napakalaki_ruby'
  require_relative 'dice'
  require_relative 'treasure'
  require_relative 'monster'
  require_relative 'bad_consequence'
  require_relative 'combat_result'
  require_relative 'monster'
  
module NapakalakiRuby

  class Player
    attr_reader :name, :hiddenTreasures, :visibleTreasures, :level, :dead,
     :pendinBadConsequence, :enemy
    @@MAXLEVEL=10    #como es de clase se inicializa fuera
    @@MINLEVEL=0

    def initialize(name)
      @name=name
      @dead=true
      @level=1
      @visibleTreasures=Array.new
      @hiddenTreasures=Array.new
      @canISteal=true
     end
     
    def copy_constructor(p)
       @name = p.name;
       @level = p.level;
       @pendingBadConsequence = p.pendingBadConsequence;
       @dead = p.dead;
       @hiddenTreasures = p.hiddenTreasures;
       @visibleTreasures = p.visibleTreasures;     
    end

    def bringToLife
      @dead=false;

    end
    
    def getCombatLevel
      resultado=@level
      @visibleTreasures.each do |i|
        resultado=resultado+@visibleTreasures.at(i).bonus
      end
      
      return resultado
    end

    def incrementLevels(l)
      @level=@level+l
      
      if(@level>@@MAXLEVEL)
        @level=10
      end
    end

    def decrementLevels(l)
      @level=@level-l
      
      if @level<0
        @level=0
      end
    end

    def setPendingBadConsequence(b)
      @pendinBadConsequence=b
    end
    #Modificado S2
    def applyPrize(m)
      nLevels=m.getLevelsGained
      incrementLevels(nLevels)
      nTreasures=m.getTreasuresGained

      if nTreasures > 0 then
        dealer=CardDealer.instance
        nTreasures.each do |i|
          treasure=dealer.nextTreasure
          @hiddenTreasures << treasure
        end
      end
    end
    #Modificado S2
    def applyBadConsequence(m)
      badConsequence=m.badConsequence
      nLevels=badConsequence.levels
      decrementLevels(nLevels)
      @pendingBadConsequence=badConsequence.adjustToFitTreasureLists(@visibleTreasures, @hiddenTreasures)
      setPendingBadConsequence(@pendinBadConsequence)
    end
    #Modificado
    def canMakeTreasureVisible(t)
      cont=0
      i=0
      correcto=false
      while i < @visibleTreasures.size
        if @visibleTreasures[i].type== t.type
          cont=cont+1
        end
        i=i+1
      end
      if cont < 1 || t.type== TreasureKind::ONEHAND && cont<2
        correcto=true
      end
      return correcto
    end

    def howManyVisibleTreasures(tKind)
      contador=0

        @hiddenTreasures.each{ |h| 
          if h.type == tKind
            contador=contador+1
          end
        }

      contador
    end

      def dieIfNoTreasures
      if @hiddenTreasures.empty? && @visibleTreasures.empty? 
            @dead=true;
      end
    end
    
    
    def isDead
      @dead
    end

    def combat(m)
      
      myLevel=getCombatLevel
      monsterLevel=m.combatLevel
      
      if myLevel > monsterLevel then
        applyPrize(m)
        if @level >= @@MAXLEVEL then
          applyPrize(m)
          combat=CombatResult::WINGAME
        else
          combat=CombatResult::WIN
        end
      else
        applyBadConsequence(m)
        combat=CombatResult::LOSE
        if shouldConvert
          combat=CombatResult::LOSEANDCONVERT
        end
      end
      return combat
    end
    
    def shouldConvert
      shouldConv=false
      dice=Dice.instance
      num=dice.nextNumber
      
      if num==1 then
        shouldConv=true
      end
      return shouldConv
    end

    def makeTreasureVisible(t)
      canI=canMakeTreasureVisible(t)
      if canI then
        @visibleTreasures << t #o usamos .push(t)
        @hiddenTreasures.delete(t)        
      end
    end

    def discardVisibleTreasure(treasure)
      @visibleTreasures.delete(treasure)
      if @pendingBadConsequence != nil  && !@pendingBadConsequence.empty? then
        @pendinBadConsequence.substractVisibleTreasure(treasure)

      end
      dieIfNoTreasures
    end

    def discardHiddenTreasure(treasure)
        @hiddenTreasures.delete(treasure)

      if @pendinBadConsequence != nil && !@pendinBadConsequence.empty? then
        @pendinBadConsequence.substractHiddenTreasure(treasure)
      end
      dieIfNoTreasures
    end

    def validState
      valido=false;

      if @pendingBadConsequence != nil && @hiddenTreasures.length <= 4 then
           valido=true;
       end 

      valido
    end
    #Modificado S2
    def initTreasures
      dealer=CardDealer.instance
      dice=Dice.instance
      bringToLife
      treasure=dealer.nextTreasure
      @hiddenTreasures << treasure
      number=dice.nextNumber
      
      if number > 1 then
        treasure=dealer.nextTreasure
        @hiddenTreasures << treasure
      end
      
      if number == 6 then
        treasure=dealer.nextTreasure
        @hiddenTreasures << treasure
      end
    end

    def getLevels
      return @level
    end
    #Modificado S2
    def stealTreasure
      treasure=nil
      canI=canISteal
      if canI then
        canYou=@enemy.canYouGiveMeATreasure
        if canYou then
          treasure=@enemy.giveTreasureBack
          @hiddenTreasures << treasure
          haveStolen
        end
      end
      return treasure
    end

    def setEnemy( enemy)
      @enemy=enemy  

    end
    #Modificado
    def giveMeATreasure
      rand=Random.new
      totTesOcu=@hiddenTreasures.length
      valor=rand(totTesOcu)

      return @hiddenTreasures.at(valor)
    end

    def canISteal
     robado=false

      if @hiddenTreasures.empty? && @visibleTreasures.empty?
        robado=true
       end

       return robado
    end

    def canYouGiveMeATreasure

        ser_robado=false;
        if @visibleTreasures.size >0 || @hiddenTreasures.size >0 
           ser_robado=true;
       end
       return ser_robado
    end

    def haveStolen
      @canISteal=false
    end
    #Modificado S2 Copia de colecciones
    def discardAllTreasures
      while !@visibleTreasures.empty? do
        discardVisibleTreasure(@visibleTreasures.at(0))
      end
      
      while !@hiddenTreasures.empty? do
        discardHiddenTreasure(@hiddenTreasures.at(0))
      end
    end
    
    def to_s
      " Nombre: #{@name} Nivel: #{@level}"
    end
    
  end
end
