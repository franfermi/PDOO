# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
# encoding: UTF-8
require_relative 'treasure_kind.rb'

module NapakalakiRuby

  class BadConsequence
    #con esto tenemos el get 
  attr_reader :text, :levels, :nVisibleTreasures, :nHiddenTreasures, 
    :specificVisibleTreasures , :specificHiddenTreasures,:death 

    #@@MAXTREASURES=10;

    def initialize(aText, someLevels)
      @text=aText
      @levels=someLevels
    end
=begin
    private_class_method :new    
    #con el self dice que es un metodo de la clase, como es un constructor, solo los constructores son de clase
    def self.newLevelNumberOfTreasures (aText, someLevels, someVisibleTreasures, someHiddenTreasures)
      new(aText, someLevels, someVisibleTreasures, someHiddenTreasures, Array.new, Array.new)
    end  
    def self.newLevelSpecificTreasures (aText, someLevels, someSpecificVisibleTreasures, someSpecificHiddenTreasures)
      new(aText, someLevels, 0, 0, someSpecificVisibleTreasures, someSpecificHiddenTreasures)  
    end
    def self.newDeath (aText)
      new(aText, 0, 0, 0, Array.new, Array.new, true)  
    end
=end
     def isEmpty
     end
   
     def substractVisibleTreasure(t)
     end
   
     def substractHiddenTreasure(t)
     end
  
    def adjustToFitTreasureLists(v, h)
      
    end
    
  
    def to_s
      "Text = #{@text}" + 
      "Levels = #{@levels}"
    end
 
    end
  end
