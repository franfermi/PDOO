# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
# encoding: UTF-8
require_relative 'treasure_kind.rb'

class BadConsequence
  #con esto tenemos el get 
attr_reader :text, :levels, :nVisibleTreasures, :nHiddenTreasures, 
  :specificVisibleTreasures , :specificHiddenTreasures,:death 

  @@MAXTREASURES=10;
  
  def initialize(aText, someLevels, someVisibleTreasures, someHiddenTreasures, 
someSpecificVisibleTreasures, someSpecificHiddenTreasures, death)
    @text=aText
    @levels=someLevels
    @nVisibleTreasures=someVisibleTreasures
    @nHiddenTreasures=someHiddenTreasures
    @death=death
    @specificVisibleTreasures=someSpecificVisibleTreasures
    @specificHiddenTreasures=someSpecificHiddenTreasures
  end
private_class_method :new    
  #cn el self dice que es un metodo de la clase, como es un constructor, solo los constructores son de clase
  def self.newLevelNumberOfTreasures (aText, someLevels, someVisibleTreasures, someHiddenTreasures)
    new(aText, someLevels, someVisibleTreasures, someHiddenTreasures)
  end  
  def self.newLevelSpecificTreasures (aText, someLevels, someSpecificVisibleTreasures, someSpecificHiddenTreasures)
    new(aText,someLevels,0, 0, someSpecificVisibleTreasures, someSpecificHiddenTreasures)  
  end
  def self.newDeath (aText)
    new(aText, 0, 0, 0, Array.new, Array.new, true)  
  end
   
   def to_s
      put_s"Texto: #{@text} \n Niveles: #{@levels} \n Tesoros Visibles: #{@nVisibleTreasures} \n  Tesoros Ocutos: #{@nHiddenTreasures} 
      \n Tesoros Visibles Especificos #{@specificVisibleTreasures} \n Tesoros Ocultos Especificos #{@specificHiddenTreasures}
     \n Muerte #{@death}"
      
    end
    
   def isEmpty
     empty = false      
        if @levels == 0 && @death == false && @nHiddenTreasures == 0 && @nVisibleTreasures == 0  && 
            @specificHiddenTreasures.empty? && @specificVisibleTreasures.empty? then
            empty = true
        end
        
        return empty
   end
   
   def substractVisibleTreasure(t)
     
   end
   
   def substractHiddenTreasure(t)
     
   end
    
   def adjustToFitTreasureLists(v, h)
     
   end
   
  def to_s
    "text = #{@text} levels = #{@levels}"+
      " vTreasures = #{@nVisibleTreasures} hTreasures = #{@nHiddenTreasures}" +
      " sHTreasures = #{@specificHiddenTreasures} sVTreasures = #{@specificVisibleTreasures}"
  end
  
end
