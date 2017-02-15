# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
module NapakalakiRuby
  class NumericBadConsequence < BadConsequence
    attr_reader :nVisibleTreasures, :nHiddenTreasures 
    @@MAXTREASURES=10; 

    def initialize(aText, someLevels, someVisibleTreasures, someHiddenTreasures)
      @text=aText
      @levels=someLevels
      @nVisibleTreasures=someVisibleTreasures
      @nHiddenTreasures=someHiddenTreasures
    end

    def isEmpty
      empty = false      
      if @nHiddenTreasures == 0 && @nVisibleTreasures == 0 then
        empty = true
      end
      return empty
    end

    def substractVisibleTreasure
      if @nVisibleTreasures > 0 then
        @nVisibleTreasures-=1
      end
    end
       #Modificado
    def substractHiddenTreasure
      if @nHiddenTreasures > 0 then
        @nHiddenTreasures-=1
      end
    end
    
    def adjustToFitTreasureLists(v, h)
      treasuresVisible=Array.new
      treasuresHidden=Array.new
      bad=NumericBadConsequence.new("", 1, 0, 0)
     
      if @nHiddenTreasures>0 || @nVisibleTreasures>0
              if @nVisibleTreasures>v.length
                nVis=v.length
              else
                nVis=@nVisibleTreasures

              end

            if @nHiddenTreasures>h.length
              nHid=h.length
            else
              nHid=@nHiddenTreasures
            end  
            bad=NumericBadConsequence.new(@text, 0, nVis, nHid)
        end
        return bad
    end
    
    def to_s
        "Tesoros visibles = #{@nVisibleTreasures}" +
        "Tesoros ocultos = #{@nHiddenTreasures}"
    end
  end
end
