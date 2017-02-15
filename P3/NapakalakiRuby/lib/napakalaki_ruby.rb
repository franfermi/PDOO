# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

require_relative 'card_dealer'
require_relative 'player'

module NapakalakiRuby
  require "singleton"

  class Napakalaki
    
    include Singleton

    attr_reader :unusedMonsters, :dealer, :players
    attr_accessor :currentPlayer, :currentMonster 

   # @@instance=nil
   #yo creo que tampoco hay que ponerlo en el attr_Reader el instance

    def initialize()
      @players=Array.new

      
    end
    #Modificado
    def initPlayers(names)
      @dealer=CardDealer.instance
      @players=Array.new

      names.each do |n|
        players << Player.new(n)
      end 
    end
    #Modificado
    def nextPlayer
      totalPlayers=@players.length #También se puede usar size

      if(@currentPlayer==nil) then
        sigIndex=rand(totalPlayers)

      else
        currentPlayerIndex=@players.index(@currentPlayer)

        if(currentPlayerIndex==totalPlayers) then
          sigIndex=0
        else
          sigIndex=currentPlayerIndex + 1
        end
      end
      nextPlayer=@players.at(sigIndex) #Obtiene el indice del siguiente judador
      @currentPlayer=nextPlayer
      return @currentPlayer
    end
    #Modificado
    def nextTurnIsAllowed
      if(@currentPlayer==nil)then
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
    #Modificado S2 COMPLETAR
    def developCombat
      combat=@currentPlayer.combat(@currentMonster)
      @dealer.giveMonsterBack(@currentMonster)

      return combat
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

        if stateOK
          @currentMonster=@dealer.nextMonster
          @currentPlayer=nextPlayer
          dead=@currentPlayer.isDead
          if dead
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

