# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

require_relative 'napakalaki_ruby'
require_relative 'GameTester'

module NapakalakiRuby

  class EjemploMain
   
      def prueba
        
       test = GameTester.instance
     
       game = Napakalaki.instance
   
       #Se prueba el juego con 2 jugadores
   
       test.play(game, 2);
       
      end
      
  end
  
    e = EjemploMain.new
    e.prueba()

end
