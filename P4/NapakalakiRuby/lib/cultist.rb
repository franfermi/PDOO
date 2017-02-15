# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
module NapakalakiRuby

class Cultist 
  attr_reader :name, :gainedLevels
  
  def initialize(name, gainedLevels)
     @name=name
     @gainedLevels=gainedLevels
  end
  
  def to_s
    return "Nombre: #{@name} \nNiveles Ganados: #{@gainedLevels}"
  end
end
end
