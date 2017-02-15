# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
# encoding: UTF-8
require_relative 'treasure_kind.rb'

#module NapakalakiRuby

  class BadConsequence
    #con esto tenemos el get 
  attr_reader :text, :levels, :nVisibleTreasures, :nHiddenTreasures, 
    :specificVisibleTreasures , :specificHiddenTreasures,:death 

    @@MAXTREASURES=10;

    def initialize(aText, someLevels, someVisibleTreasures, someHiddenTreasures, 
  someSpecificVisibleTreasures, someSpecificHiddenTreasures, death=false)
      @text=aText
      @levels=someLevels
      @nVisibleTreasures=someVisibleTreasures
      @nHiddenTreasures=someHiddenTreasures
      @death=death
      @specificVisibleTreasures=someSpecificVisibleTreasures
      @specificHiddenTreasures=someSpecificHiddenTreasures
    end
  private_class_method :new    
    #con el self dice que es un metodo de la clase, como es un constructor, solo los constructores son de clase
    def self.newLevelNumberOfTreasures (aText, someLevels, someVisibleTreasures, someHiddenTreasures)
      new(aText, someLevels, someVisibleTreasures, someHiddenTreasures, Array.new, Array.new)
    end  
    def self.newLevelSpecificTreasures (aText, someLevels, someSpecificVisibleTreasures, someSpecificHiddenTreasures)
      new(aText,someLevels,0, 0, someSpecificVisibleTreasures, someSpecificHiddenTreasures)  
    end
    def self.newDeath (aText)
      new(aText, 0, 0, 0, Array.new, Array.new, true)  
    end

     def isEmpty
       empty = false      
          if @levels == 0 && @death == false && @nHiddenTreasures == 0 && @nVisibleTreasures == 0  && 
              @specificHiddenTreasures.empty? && @specificVisibleTreasures.empty? then
              empty = true
          end

          return empty
     end
     #Modificado
     def substractVisibleTreasure(t)
       specificVisibleTreasures.delete(t.type)
       nVisibleTreasures-=1
     end
     #Modificado
     def substractHiddenTreasure(t)
       specificHiddenTreasures.delete(t.type)
       nHiddenTreasures-=1 #En ruby no esta el operador --
     end

    def to_s
      "text = #{@text} levels = #{@levels}"+
        " vTreasures = #{@nVisibleTreasures} hTreasures = #{@nHiddenTreasures}" +
        " sHTreasures = #{@specificHiddenTreasures} sVTreasures = #{@specificVisibleTreasures}" +
        "muerte = #{@death}";
    end
    #Modificado S2 Consultar!!!!
    def adjustToFitTreasureLists(v, h)

     treasuresVisible=Array.new
     treasuresHidden=Array.new
     i=0
     
      if !@specificHiddenTreasures.empty? || !@specificVisibleTreasures.empty?
        
        if !v.empty?
           v.each{|tV|
               if !treasuresVisible.at(i)== tV.type
                  treasuresVisible<<tV.type
               end
               i=i+1
           }
        end
        i=0
        if !h.empty?
          h.each{|tH|
               if !treasuresHidden.at(i)== tH.type
                  treasuresHidden<<tH.type
               end
               i=i+1
           }
        end
        badConsequenceAdjust=BadConsequence.newLevelSpecificTreasures( @text, 0, treasuresVisible,treasuresHidden); 
      
      else
          if @nHiddenTreasures>0 || @nVisibleTreasures>0
              if @nVisibleTreasures>v.size
                nVis=v.size
              else
                nVis=@nVisibleTreasures

              end

            if @nHiddenTreasures>h.size
              nHid=h.size
            else
              nHid=@nHiddenTreasures

            end  
            badConsequenceAdjust=BadConsequence.new(@text,0,nVis,nHid)
        end
        
      end
 
        return badConsequenceAdjust
    end
  end
#end
