# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

require_relative 'treasure_kind.rb'

class BadConsequence
  #con esto tenemos el get 
attr_reader :Text, :Level, :nVisibleTreasures, :nHiddenTreasures, 
  :SpecificVisibleTreasures , :SpecificHiddenTreasures,:Death 
private_class_method :new 

  @@MAXTREASURES=10;
  
  def initialize(aText, someLevels, someVisibleTreasures, someHiddenTreasures, 
someSpecificVisibleTreasures, someSpecificHiddenTreasures, death)
    @Text=aText
    @Level=someLevels
    @nVisibleTreasures=someVisibleTreasures
    @nHiddenTreasures=someHiddenTreasures
    @Death=death
    @SpecificVisibleTreasures=someSpecificVisibleTreasures
    @SpecificHiddenTreasures=someSpecificHiddenTreasures
  end
    
  #cn el self dice que es un metodo de la clase, como es un constrcutor, solo los constructores son de clase
   def self.newLevelNumberOfTreasures( aText, someLevels, someVisibleTreasures, someHiddenTreasures)
     new(aText,someLevels,someVisibleTreasures,someHiddenTreasures,Array.new,Array.new,false)
     
   end
   
   def self.newLevelSpecificTreasures (aText, someLevels,someSpecificVisibleTreasures, someSpecificHiddenTreasures)
     
     new(aText,someLevels,0,0,someSpecificVisibleTreasures,someSpecificHiddenTreasures,false)
   end
    
   def self.newDeath (aText)
     new(aText,0,0,0,0,0,true)
   end
   
   def to_s
      put_s"Niveles: #{@Levels} \n Tesoros Visibles: #{@VisibleTreasures} \n  Tesoros Ocutos: #{@HiddenTreasures} 
      \n Tesoros Visibles Especificos #{@SpecificVisibleTreasures} \n Tesoros Ocultos Especificos #{@SpecificHiddenTreasures}
     \n Muerte #{@Death}"
      
    end
    
   def isEmpty
     empty = false      
        if @levels == 0 && @Death == false && @nHiddenTreasures == 0 && @nVisibleTreasures == 0  && 
            @SpecificHiddenTreasures.empty? && @SpecificVisibleTreasures.empty? then
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
  
end
