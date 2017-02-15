# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
  
class Napakalaki

attr_reader :unusedMonsters, :dealer, :players, :instance
attr_accessor :currentPlayer, :currentMonster 

@@instance=nil
  
def initialize(currentMonster, dealer, players, currentPlayer)
  @currentMonster=currentMonster
  @dealer=dealer
  @players=players
  @currentPlayer=currentPlayer
end

def initPlayers(names)
  
end

def nextPlayer
  
end

def nextTurnAllowed
  
end

def setEnemies
  
end

def developCombat
  return CombatResult::WIN
end

def discardVisibleTreasures(treasures)
  
end

def discardHiddenTreasures(treasures)
  
end

def makeTreasuresVisible(treasures)
  
end

def initGame(players)
  
end

def nextTurn
  
end

def endOfGame(result)
  
end
end

