# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
module M
  class A


    def metodo1
    puts self.inspect
    end

    def self.metodo2
    puts self.inspect
    end

  end
  
  puts self.inspect
  a = A.new
  a.metodo1
  A.metodo2

end