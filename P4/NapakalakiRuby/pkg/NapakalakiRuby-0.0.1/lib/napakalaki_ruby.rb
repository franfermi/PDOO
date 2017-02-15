# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

require_relative 'card_dealer'
require_relative 'player'
require_relative 'cultist_player'

module NapakalakiRuby
  require "singleton"

  class Napakalaki
    
    include Singleton

    attr_accessor :currentPlayer, :currentMonster, :players, :dealer 

    def initialize()
      @players=Array.new
      @currentPlayer=nil
      @currentMonster=nil
      
    end
    #Modificado
    def initPlayers(names)
      @dealer=CardDealer.instance
      @players=Array.new

      names.each do |n|
        @players << Player.new(n)
      end 
    end
    #Modificado
    def nextPlayer
      #totalPlayers=@players.length #También se puede usar size

      if @currentPlayer.nil? then
        ju=@players.at(rand(@players.size))
        # sigIndex=rand(totalPlayers)
      else
 #       currentPlayerIndex=@players.index(@currentPlayer)
  #      actual=@players.index(@currentPlayer)
        actual=@players.index(@currentPlayer)
        sig=(actual+1)%@players.size
        ju=@players.at(sig)
        #if currentPlayerIndex==totalPlayers then
         # sigIndex=0
        #else
         # sigIndex=currentPlayerIndex + 1
        end
        ju
    end
      
      #nextPlayer=@players.at(sigIndex) Obtiene el indice del siguiente judador
      #@currentPlayer=nextPlayer
     # return @currentPlayer
    #end
    #Modificado
    def nextTurnIsAllowed
      if @currentPlayer==nil then
        allowed=true
      else
        allowed=@currentPlayer.validState
      end
      return allowed
    end
    #Modificado
    def setEnemies
      totalPlayers=@players.length

      players.each do |p|
        indexEnemy=rand(totalPlayers)
        while(p==@players.at(indexEnemy))
          indexEnemy=rand(totalPlayers)
        end
        p.setEnemy(@players.at(indexEnemy))
      end
    end
    
    def developCombat
       combat_result = @currentPlayer.combat(@currentMonster)
      @dealer.giveMonsterBack(@currentMonster)
      
      if combat_result == CombatResult::LOSEANDCONVERT
        c = CardDealer.instance.next_cultist
        cP = CultistPlayer.new(@currentPlayer, c)
        
        @players[@players.index(@currentPlayer)] = cP
        @currentPlayer = cP
   
=begin  combat=@currentPlayer.combat(@currentMonster)
      @dealer.giveMonsterBack(@currentMonster)
      
      if combat == CombatResult::LOSEANDCONVERT then
        cultist=CardDealer.instance.nextCultist
        culPlayer=CultistPlayer.new(@currentPlayer, cultist)
        currentPlayerIndex=@players.at(@currentPlayer)
        @players.delete(currentPlayerIndex)
        @currentPlayer=culPlayer
=end
      end
      return combat_result
    end
    
    #Modificado S2
    def discardVisibleTreasures(treasures)
      treasures.each do |t|
        @currentPlayer.discardVisibleTreasure(t)
        @dealer.giveTreasureBack(t)
      end
    end

    def discardHiddenTreasures(treasures)
      treasures.each do |t|
        @currentPlayer.discardHiddenTreasure(t)
        @dealer.giveTreasureBack(t)
      end
    end
    #Modificado S2 
    def makeTreasuresVisible(treasures)
      treasures.each do |t|
        @currentPlayer.makeTreasureVisible(t)
      end
    end
    #Modificado S2
    def initGame(players)
      initPlayers(players)
      setEnemies
      @dealer.initCards
      nextTurn
    end
    #Modificado
    def getCurrentPlayer
      return @currentPlayer
    end
    #Modificado
    def getCurrentMonster
      return @currentMonster
    end
    #Modifcado S2
    def nextTurn
        stateOK= nextTurnIsAllowed

        if stateOK then
          @currentMonster=@dealer.nextMonster
          @currentPlayer=nextPlayer
          dead=@currentPlayer.isDead
          if dead then
            @currentPlayer.initTreasures
          end 
        end
        return stateOK
    end
    #Modificado
    def endOfGame(result)
      endGame=false
      if(result==CombatResult::WINGAME)
        endGame=true
      end
      return endGame
    end

    end
end

