# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
module NapakalakiRuby
  class SpecificBadConsequence < BadConsequence
    attr_reader :text, :levels, :specificVisibleTreasures, :specificHiddenTreasures
    
    def initialize(aText, someLevels, someSpecificVisibleTreasures, someSpecificHiddenTreasures)
      @text=aText
      @levels=someLevels
      @specificVisibleTreasures=someSpecificVisibleTreasures
      @specificHiddenTreasures=someSpecificHiddenTreasures 
    end
    
    def isEmpty
      empty = false      
      if @specificVisibleTreasures.empty? && @specificHiddenTreasures.empty? then
        empty = true
      end
      return empty
    end

    def substractVisibleTreasure(t)
      @specificVisibleTreasures.delete(t.type)
    end
       #Modificado
    def substractHiddenTreasure(t)
      @specificHiddenTreasures.delete(t.type)
    end
    
    def adjustToFitTreasureLists(v, h)
      treasuresVisible=Array.new
      treasuresHidden=Array.new
      bad=SpecificBadConsequence.new("", 1, 0, 0)
     
      if !@specificHiddenTreasures.empty? || !@specificVisibleTreasures.empty?
        
        if !v.empty?
            v.each{|tV|
              if !treasuresVisible.include?(tV.type)
                  treasuresVisible<<tV.type
              end
           }
        end
        if !h.empty?
          h.each{|tH|
              if !treasuresHidden.include?(tH.type)
                  treasuresHidden<<tH.type
              end
           }
        end
        bad=SpecificBadConsequence.new( @text, 0, treasuresVisible,treasuresHidden); 
      end
        return bad
    end
    
    def to_s
        "Tesoros visibles especificos = #{@specificHiddenTreasures}"  + 
        "Tesoros ocultos especificos = #{@specificVisibleTreasures}" 
    end

  end
end
 
