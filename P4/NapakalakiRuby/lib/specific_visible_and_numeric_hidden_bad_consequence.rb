# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
module NapakalakiRuby
  class SpecificVisibleAndNumericHiddenBadConsequence < BadConsequence
    def initialize(aText, someLevels, someVisibleSpecificTreasures, someHiddenTreasures)
        @text=aText
        @levels=someLevels
        @specificVisibleTreasures=someVisibleSpecificTreasures 
        @nHiddenTreasures=someHiddenTreasures  
    end

    def isEmpty
        empty = false      
        if @specificVisibleTreasures.empty? && @nHiddenTreasures==0 then
          empty = true
        end
        return empty
    end

    def substractVisibleTreasure(t)
      @specificVisibleTreasures.delete(t.type)
    end

    def substractHiddenTreasure
      if @nHiddenTreasures > 0 then
        @nHiddenTreasures-=1
      end

    end

    def adjustToFitTreasureLists(v, h)
        treasuresVisibles=Array.new
        bad=SpecificVisibleAndNumericHiddenBadConsequence.new("", 1, Array.new, 0)

        if @nHiddenTreasures>0
            if @nHiddenTreasures>h.length
              nH=h.length
            else
              nH=@nHiddenTreasures
            end

            bad=SpecificVisibleAndNumericHiddenBadConsequence.new(@text, 0, Array.new, nH)

        else
          if !@specificVisibleTreasures.empty?
            if !v.empty?
              v.each{|tV|
                if !treasuresVisibles.include?(tV.type)
                  treasuresVisibles<<tV.type
                end
              }
            end
            bad=SpecificVisibleAndNumericHiddenBadConsequence.new(@text, 0, treasuresVisibles, 0)
          end
        end
      return bad
    end

    def to_s
        "Tesoros visibles especificos= #{@specificVisibleTreasures}"  + 
        "Tesoros ocultos = #{@nHiddenTreasures}" 
    end
  end
end
