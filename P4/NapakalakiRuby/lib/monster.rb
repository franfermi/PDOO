# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

require_relative 'prize'
require_relative 'bad_consequence'
require_relative 'player'
require_relative 'napakalaki_ruby'
require_relative 'dice'
require_relative 'treasure'

module NapakalakiRuby

  class Monster
    attr_reader :name, :combatLevel, :badConsequence, :prize, :levelChangeAgainstCultistPlayer, :ic
    public
      def initialize(name , combatLevel, badConsequence, prize, ic=0)
        @name=name
        @combatLevel=combatLevel
        @badConsequence=badConsequence
        @prize=prize
        @levelChangeAgainstCultistPlayer=ic
      end
      
    
     def getLevelsGained
       @prize.levels
     end

     def getTreasuresGained
       @prize.treasures
     end
     
     def getCombattLevel
       @combatLevel
     end
     
     def getLevelChangeAgainstCultistPlayer
       return @levelChangeAgainstCultistPlayer + @combatLevel
     end
     
     def to_s
      "Name = #{@name}  CombatLevel = #{@combatLevel}"
     end

  end
end
