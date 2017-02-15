# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class Dice
  include Singleton
  att_reader :instance
 
  
  def initialize
    @@instance=nil
  end
    
  def nextNumber
    
  end
end
