#!/usr/bin/env ruby
#encoding: utf-8

require_relative 'TreasureKind.rb'

class BadConsequence
attr_reader :text, :level, :nVisible, :nHidden, :specificVisibleTreasures, 
                  :specificHiddenTreasures, :death #Consultor GET
 private_class_method :new  
  def initialize(aText, someLevels, someVisibleTreasures, someHiddenTreasures,
                someSpecificVisibleTreasures, someSpecificHiddenTreasures, death)
    @text = aText
    @level = someLevels
    @nVisible = someVisibleTreasures
    @nHidden = someHiddenTreasures
    @specificVisibleTreasures = someSpecificVisibleTreasures
    @specificHiddenTreasures = someSpecificHiddenTreasures
    @death = death
  end

  def self.newLevelNumberOfTreasures(aText, someLevels, someVisibleTreasures, someHiddenTreasures)
    new(aText, someLevels, someVisibleTreasures, someHiddenTreasures, Array.new, Array.new, false)
  end

  def self.newLevelSpecificTreasures(aText, someLevels, someSpecificVisibleTreasures, someSpecificHiddenTreasures)
    new(aText, someLevels, 0, 0, Array.new(someSpecificVisibleTreasures), Array.new(someSpecificHiddenTreasures), false)
  end
  
  def self.newDeath(aText)
    new(aText, 0, 0, 0, Array.new, Array.new, true)
  end
  
  def to_s
    "Texto: #{@text} \n Nivel: #{@level} \n Tesoros visibles: #{@nVisible} \n Tesoros ocultos: #{@nHidden} \n 
      Objetos visibles perdidos: #{@specificVisibleTreasures} \n Objetos ocultos perdidos: #{@specificHiddenTreasures} \n
      Muerte: #{@death}"
  end
end
