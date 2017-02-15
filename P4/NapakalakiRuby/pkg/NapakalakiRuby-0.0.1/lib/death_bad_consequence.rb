# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
module NapakalakiRuby
  class DeathBadConsequence < NumericBadConsequence
    attr_reader :death
    
    def initialize(aText, levels, death)
      @text=aText
      @levels=levels
      @death=death
    end
    
    def to_s
        "Muerte = #{@death}"
    end
  end
end