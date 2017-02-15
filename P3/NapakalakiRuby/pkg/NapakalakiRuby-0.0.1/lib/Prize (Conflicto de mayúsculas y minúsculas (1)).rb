# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class Prize
  attr_reader :Treasure, :Level
  
  #este es el contructor por defecto
  def initialize(treasure, level)
    @Treasures=treasure
    @Level=level
  end
  
  def to_s
    puts "Niveles: #{@Level} \n Premio: #{@Treasure} \n"
  end
  
  
  
  
  
  
  
  
  
end
