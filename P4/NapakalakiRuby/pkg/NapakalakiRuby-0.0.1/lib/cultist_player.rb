# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
require_relative 'treasure'
require_relative 'monster'
require_relative 'treasure_kind'
require_relative 'combat_result'
require_relative 'dice'
require_relative 'napakalaki_ruby'
require_relative 'player'

module NapakalakiRuby

class CultistPlayer < Player
    attr_accessor :myCultistCard
    
    @@totalCultistPlayers=0
    
  def initialize(p, c)
    super(p.name)
    @myCultistCard=c
    @@totalCultistPlayers=+1
  end
  
  def getCombatLevel
    x=(super.getCombatLevel * 20) / 100
    porcentaje=x.truncate
    
    return super.getCombatLevel + porcentaje + (@myCultistCard.getLevelsGained * @@totalCultistPlayers)
  end
  
  def getOponentLevel(m)
    return m.getLevelChangeAgainstCultistPlayer
  end
  
  def shouldConvert
    return false
  end
  
  def giveMeATreasure
    rnd=Random.new
    tope=super.visibleTreasures.length
    valor=rnd(tope)
    
    return super.visibleTreasures.at(valor)
  end
  
  def canYouGiveMeATreasure
    ser_robado=false
    if super.visibleTreasures.length > 0 then
      ser_robado=true
    end
    return ser_robado
  end
end
end
