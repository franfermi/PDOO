# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

require_relative 'prize'
require_relative 'bad_consequence'

module NapakalakiRuby

  class Monster
    attr_reader:name, :combatLevel, :badConsequence, :prize

      def initialize(name , combatLevel, badConsequence, prize)
        @name=name
        @combatLevel=combatLevel
        @badConsequence=badConsequence
        @prize=prize
      end

     def to_s
      "Monster = #{@name} CombatLevel = #{@combatLevel}"
     end

     def getLevelsGained
       @prize.levels
     end

     def getTreasuresGained
       @prize.treasures
     end
  end
end
