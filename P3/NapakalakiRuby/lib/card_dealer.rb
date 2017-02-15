# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
module NapakalakiRuby
  
  require "singleton" #modificado
  require_relative 'treasure'
  require_relative 'treasure_kind'
  require_relative 'monster'
  
  class CardDealer

    include Singleton
    attr_reader  :unusedMonsters, :usedMonsters, :usedTreasures, :unusedTreasures

    #@@instance=nil

    def initialize
      @unusedMonsters=Array.new
      @usedMonsters=Array.new
      @usedTreasures=Array.new
      @unusedTreasures=Array.new
    end
    

    def initTreasureCardDeck
     # @unusedTreasures = Array.new

      @unusedTreasures << Treasure.new("Si mi amo", 4, TreasureKind::HELMET)
      @unusedTreasures << Treasure.new("Botas de investigacion", 3, TreasureKind::SHOES);
      @unusedTreasures << Treasure.new("Capucha de Cthulhu", 3, TreasureKind::HELMET);
      @unusedTreasures << Treasure.new("A prueba de babas", 2, TreasureKind::ARMOR);
      @unusedTreasures << Treasure.new("Botas de lluvia acida", 1, TreasureKind::BOTHHANDS);
      @unusedTreasures << Treasure.new("Casco minero", 2, TreasureKind::HELMET);
      @unusedTreasures << Treasure.new("Ametralladora Thompson", 4, TreasureKind::BOTHHANDS);
      @unusedTreasures << Treasure.new("Camiseta de la UGR", 1, TreasureKind::ARMOR);
      @unusedTreasures << Treasure.new("Clavo de rail ferroviario", 3, TreasureKind::ONEHAND);
      @unusedTreasures << Treasure.new("Cuchillo de sushi arcano", 2, TreasureKind::ONEHAND);
      @unusedTreasures << Treasure.new("Fez alopodo", 3, TreasureKind::HELMET);
      @unusedTreasures << Treasure.new("Hacha prehistorica", 2, TreasureKind::ONEHAND);
      @unusedTreasures << Treasure.new("El aparato del Pr. Tesla", 4, TreasureKind::ARMOR);
      @unusedTreasures << Treasure.new("Gaita", 4, TreasureKind::BOTHHANDS);
      @unusedTreasures << Treasure.new("Insecticida", 2, TreasureKind::ONEHAND);
      @unusedTreasures << Treasure.new("Escopeta de 3 canones", 4, TreasureKind::BOTHHANDS);
      @unusedTreasures << Treasure.new("Garabato Mistico", 2, TreasureKind::ONEHAND);
      @unusedTreasures << Treasure.new("La rebeca metalica", 2, TreasureKind::ARMOR);
      @unusedTreasures << Treasure.new("Lanzallamas", 4, TreasureKind::BOTHHANDS);
      @unusedTreasures << Treasure.new("Necro-comicon", 1, TreasureKind::ONEHAND);
      @unusedTreasures << Treasure.new("Necronomicon", 5, TreasureKind::BOTHHANDS);
      @unusedTreasures << Treasure.new("Linterna a 2 manos", 3, TreasureKind::BOTHHANDS);
      @unusedTreasures << Treasure.new("Necro-gnomicon", 2, TreasureKind::ONEHAND);
      @unusedTreasures << Treasure.new("Necrotelecom", 2, TreasureKind::HELMET);        
      @unusedTreasures << Treasure.new("Mazo de los antiguos", 3, TreasureKind::ONEHAND);
      @unusedTreasures << Treasure.new("Necro-playboycon", 3, TreasureKind::ONEHAND);
      @unusedTreasures << Treasure.new("Porra preternatural", 2, TreasureKind::ONEHAND);
      @unusedTreasures << Treasure.new("Shogulador", 1, TreasureKind::BOTHHANDS);
      @unusedTreasures << Treasure.new("Varita de atizamiento", 3, TreasureKind::ONEHAND);       
      @unusedTreasures << Treasure.new("Tentacula de pega", 2, TreasureKind::HELMET);
      @unusedTreasures << Treasure.new("Zapato deja-amigos", 1, TreasureKind::SHOES); 
    
    end

    def initMonsterCardDeck
      @unusedMonsters = Array.new

      #1-Byakhees de bonanza
      prize = Prize.new(2,1)
      badconsequence = BadConsequence.newLevelSpecificTreasures('Pierdes tu armadura visible y otra oculta',0,[TreasureKind::ARMOR],[TreasureKind::ARMOR])
      @unusedMonsters << Monster.new('3 Byakhees de bonanza',8, badconsequence, prize)

      #2-Chibithulhu
      prize = Prize.new(1,1)
      badconsequence = BadConsequence.newLevelSpecificTreasures('Embobados con el lindo primigenio te descartas de tu casco visible', 0, [TreasureKind::HELMET], Array.new)
      @unusedMonsters << Monster.new('Chibithulhu',2, badconsequence, prize)

      #3-El sopor de Dunwich
      prize = Prize.new(1,1)
      badconsequence = BadConsequence.newLevelSpecificTreasures('El primordial bostezto contagioso. Pierdes el calzado visible',0,[TreasureKind::SHOES], Array.new)
      @unusedMonsters << Monster.new('El sopor de Dunwich', 2,badconsequence, prize)

      #4-Angeles de la noche ibicenca
      prize = Prize.new(4,1)
      badconsequence = BadConsequence.newLevelSpecificTreasures('Te atrapan para llevarte de fiesta y te dejan caer en mitad del vuelo.Descarta 1 mano visible y 1 mano oculta', 0, [TreasureKind::ONEHAND], [TreasureKind::ONEHAND])
      @unusedMonsters << Monster.new('Angeles de la noche ibicenca',14,badconsequence, prize)

      #5-El gorron en el umbral
      prize = Prize.new(3,1)
      badconsequence = BadConsequence.newLevelNumberOfTreasures('Pierdes todos tus tesoros visibles', 0, 10, 0)
      @unusedMonsters << Monster.new('El gorron en el umbral', 10, badconsequence, prize)

      #6-H.P. Munchcraft
      prize = Prize.new(2,1)
      badconsequence = BadConsequence.newLevelSpecificTreasures('Pierdes la armadura visible', 0, [TreasureKind::ARMOR], Array.new)
      @unusedMonsters << Monster.new('H.P. Munchcraft', 6, badconsequence, prize)

      #7-Bichgooth
      prize = Prize.new(1, 1)
      badconsequence = BadConsequence.newLevelSpecificTreasures('Sientes bichos bajo la ropa', 0, [TreasureKind::ARMOR], Array.new)
      @unusedMonsters << Monster.new('Bichgooth', 2, badconsequence, prize)

      #8-El rey de la rosa
      prize = Prize.new(4,2)
      badconsequence = BadConsequence.newLevelNumberOfTreasures('Pierdes 5 niveles y 3 tesoros visibles',5,3,0)
      @unusedMonsters << Monster.new('El rey de la rosa', 13, badconsequence, prize)

      #9-La que redacta en las tinieblas
      prize = Prize.new(1,1)
      badconsequence = BadConsequence.newLevelNumberOfTreasures('Toses los pulmones y pierdes 2 niveles', 2, 0, 0)
      @unusedMonsters << Monster.new('La que redacta en las tinieblas', 2, badconsequence, prize)

      #10-Los hondos
      prize = Prize.new(2,1)
      badconsequence = BadConsequence.newDeath('Estos monstruos resultan bastante superficales y te aburren mortalmente. Estas muerto')
      @unusedMonsters << Monster.new('Los hondos',8,badconsequence, prize)

      #11-Semillas Cthulhu
      prize = Prize.new(2,1)
      badconsequence = BadConsequence.newLevelNumberOfTreasures('Pierdes 2 niveles y 2 tesoros ocultos', 2, 0, 2)
      @unusedMonsters << Monster.new('Semillas Cthulhu', 4, badconsequence,prize)

      #12-Dameargo
      prize = Prize.new(2,1)
      badconsequence = BadConsequence.newLevelSpecificTreasures('Te intentas escaquear. Pierdes una mano visible', 0, [TreasureKind::ONEHAND], 0)
      @unusedMonsters << Monster.new('Dameargo',1, badconsequence, prize)

      #13-Pollipolipo volante
      prize = Prize.new(1,1)
      badconsequence = BadConsequence.newLevelNumberOfTreasures('Da mucho asquito. Pierdes 3 niveles', 3, 0, 0)
      @unusedMonsters << Monster.new('Pollipolipo volante', 3, badconsequence,prize)

      #14-Yskhtihyssg-Goth
      prize = Prize.new(3,1)
      badconsequence = BadConsequence.newDeath('No le hace mucha gracia que pronuncien mal su nombre. Estas muerto')
      @unusedMonsters << Monster.new('Yskhtihyssg-Goth', 12, badconsequence,prize)

      #15-La familia feliz
      prize = Prize.new(4,1)
      badconsequence = BadConsequence.newDeath('La familia te atrapa. Estas muerto')
      @unusedMonsters << Monster.new('La familia feliz', 1, badconsequence,prize)

      #16-Roboggoth
      prize = Prize.new(2, 1)
      badconsequence = BadConsequence.newLevelSpecificTreasures('La quinta directiva primaria te obliga a perder 2 niveles y un tesoro de 2 manos visible', 2, [TreasureKind::BOTHHANDS], 0)
      @unusedMonsters << Monster.new('Roboggoth', 8, badconsequence, prize)

      #17-El espia
      prize = Prize.new(1, 1)
      badconsequence = BadConsequence.newLevelSpecificTreasures('Te asusta en la noche. Pierdes un casco visible', 0, [TreasureKind::HELMET], 0)
      @unusedMonsters << Monster.new('El espia', 5, badconsequence,prize)

      #18-El lenguas
      prize = Prize.new(1, 1)
      badconsequence = BadConsequence.newLevelNumberOfTreasures('Menudo susto te llevas. Pierdes 2 niveles y 5 tesoros visibles', 2, 5, 0)
      @unusedMonsters << Monster.new('El lenguas', 20, badconsequence, prize)

      #19-Bizefalo
      prize = Prize.new(1,1)
      badconsequence = BadConsequence.newLevelNumberOfTreasures('Te faltan manos para tanta cabeza. Pierdes 3 niveles y tus tesoros visibles de las manos', 3, 10, 0)
      @unusedMonsters << Monster.new('Bizefalo', 20, badconsequence, prize)

    end

    def shuffleTreasures
      @unusedTreasures = @unusedTreasures.shuffle
    end

    def shuffleMonsters
      @unusedMonsters = @unusedMonsters.shuffle
    end

    def nextTreasure
     #1- Comprobamos si el mazo de cartas sin usar esta vacio
        if @unusedTreasures.empty?

  #        Si esta vacio recorremos las cartas usadas y las convertimos a sin usar
  #        la agregamos al mazo de cartas -> unusedTreasures
          @usedTreasures.each do |t|                 

          @unusedTreasures<<t

          end

          #Barajamos el mazo con el metodo siguiente
          shuffleTreasures

          #Limpiamos el mazo de descartes
          @usedTreasures.clear

        end
        #2-Sacamos la primera carta del mazo de cartas sin usar
        t = @unusedTreasures.at(0)        
        #Metemos la carta en el mazo de cartas usadas
        @usedTreasures<<t        
        #Eliminamos la carta del mazo de cartas sin usar
        @unusedTreasures.delete(t);        

        return t
    end

    def nextMonster
      if @unusedMonsters.empty?            
  #        Si esta vacio recorremos las cartas usadas y las convertimos a sin usar
  #        la agregamos al mazo de cartas -> unusedMonsters
          @usedMonsters.each do |m|                 

          @unusedMonsters<<m

          end

          #Barajamos el mazo con el metodo siguiente
          shuffleMonsters

          #Limpiamos el mazo de descartes
          @usedTreasures.clear

        end

        #Sacamos la primera carta del mazo de cartas sin usar
        m = @unusedMonsters.at(0)

        #Metemos la carta en el mazo de cartas usadas
        @usedMonsters<<m

        #Eliminamos la carta del mazo de cartas sin usar
        @unusedMonsters.delete(m);

        return m 
    end

    def giveTreasureBack(treasure)
      @usedTreasures << treasure
    end

    def giveMonsterBack(monster)
      @usedMonsters << monster
    end

    def initCards
      initTreasureCardDeck
      initMonsterCardDeck
    end
  end
end
