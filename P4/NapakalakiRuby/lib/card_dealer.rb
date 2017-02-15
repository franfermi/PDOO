# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
# Victor Vallecillo Morilla

 require "singleton" 
  require_relative 'treasure'
  require_relative 'treasure_kind'
  require_relative 'monster'
  require_relative 'cultist'
  require_relative 'numeric_bad_consequence'
  require_relative 'specific_bad_consequence'
  require_relative 'death_bad_consequence'
  require_relative 'bad_consequence'
  require_relative 'prize'
  
module NapakalakiRuby
  
  class CardDealer

    include Singleton
    attr_reader :instance, :unusedMonsters, :usedMonsters, :usedTreasures, :unusedTreasures, :unusedCultists

    #@@instance=nil

    def initialize
      @unusedMonsters=Array.new
      @usedMonsters=Array.new
      @usedTreasures=Array.new
      @unusedTreasures=Array.new
      @unusedCultists=Array.new
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

     @unusedMonsters = Array.new

      prize = Prize.new(2,1)
      bad_consequence = SpecificBadConsequence.new('Pierdes tu armadura visible y otra oculta',0,[TreasureKind::ARMOR],[TreasureKind::ARMOR])
      @unusedMonsters<< Monster.new('3 Byakhees de bonanza', 8, bad_consequence, prize, 0)

      prize = Prize.new(1,1)
      bad_consequence = 
      SpecificBadConsequence.new('Embobados con el lindo primigenio te descartas de tu casco visible',0,[TreasureKind::HELMET],[])
      @unusedMonsters<< Monster.new('Chibithulhu', 2, bad_consequence, prize, 0)

      prize = Prize.new(1,1)
      bad_consequence = 
      SpecificBadConsequence.new('El primordial bostezo contagioso, Pierdes el calzado visible',0,[TreasureKind::SHOES],[])
      @unusedMonsters<< Monster.new('El sopor de Dunwich', 2, bad_consequence, prize, 0)

      prize = Prize.new(4,1)
      bad_consequence = 
      SpecificBadConsequence.new('Te atrapan para llevarte de fiesta y te dejan caer en mitad del vuelo. Descarta 1 mano visible y 1 mano oculta',0,[TreasureKind::ONEHAND],[TreasureKind::ONEHAND])
      @unusedMonsters<< Monster.new('Angeles de la noche ibicenca', 14, bad_consequence, prize, 0)

      prize = Prize.new(3,1)
      bad_consequence = 
        NumericBadConsequence.new('Pierdes todos tus tesoros visibles',0,10,0)
      @unusedMonsters<< Monster.new('El gorron en el umbral', 10, bad_consequence, prize, 0)

      prize = Prize.new(2,1)
      bad_consequence = 
      SpecificBadConsequence.new('Te atrapan para llevarte de fiesta y te dejan caer en mitad del vuelo. 
      Descarta 1 mano visible y 1 mano oculta',0,[TreasureKind::ARMOR],[])
      @unusedMonsters<< Monster.new('H.P Munchcraft', 6, bad_consequence, prize, 0)


      prize = Prize.new(1,1)
      bad_consequence = 
      SpecificBadConsequence.new('Sientes bichos bajo la ropa. Descarta la armadura visible',0,[TreasureKind::ARMOR],[])
      @unusedMonsters<< Monster.new('Bichgooth', 2, bad_consequence, prize, 0)

      prize = Prize.new(4,2)
      bad_consequence = 
      NumericBadConsequence.new('Pierdes 5 niveles y 3 tesoros visibles',5,3,0)
      @unusedMonsters<< Monster.new('El rey de la rosa', 13, bad_consequence, prize, 0)

      prize = Prize.new(1,1)
      bad_consequence = 
      NumericBadConsequence.new('Toses los pulmones y pierdes 2 niveles',2,0,0)
      @unusedMonsters<< Monster.new('La que redacta en las tinieblas', 2, bad_consequence, prize, 0)

      prize = Prize.new(2,1)
      bad_consequence = 
      DeathBadConsequence.new('Estos monstruos resultan bastante superficiales y te aburren mortalmente',0,true)
      @unusedMonsters<< Monster.new('Los hondos', 8, bad_consequence, prize, 0)

      prize = Prize.new(2,1)
      bad_consequence = 
      NumericBadConsequence.new('Pierdes 2 niveles y 2 tesoros ocultos',2,0,2)
      @unusedMonsters<< Monster.new('Semillas Cthulhu', 4, bad_consequence, prize, 0)

      prize = Prize.new(2,1)
      bad_consequence = 
      SpecificBadConsequence.new('Te intentas escaquear. Pierdes una mano visible',0,[TreasureKind::ONEHAND],[])
      @unusedMonsters<< Monster.new('Dameargo', 1, bad_consequence, prize, 0)

      prize = Prize.new(1,1)
      bad_consequence = 
      NumericBadConsequence.new('Da mucho asquito. Pierdes 3 niveles',3,0,0)
      @unusedMonsters<< Monster.new('Pollipolipo', 3, bad_consequence, prize, 0)

      prize = Prize.new(3,1)
      bad_consequence = 
      DeathBadConsequence.new('No le hace gracia que pronuncies mal su nombre. Estas muerto',0,true)
      @unusedMonsters<< Monster.new('Yskhtihyssg-Goth', 12, bad_consequence, prize, 0)

      prize = Prize.new(4,1)
      bad_consequence = 
      DeathBadConsequence.new('La familia te atrapa. Estas muerto',0,true)
      @unusedMonsters<< Monster.new('Familia feliz', 1, bad_consequence, prize, 0)

      prize = Prize.new(2,1)
      bad_consequence = 
      SpecificBadConsequence.new('La quinta directiva primaria te obliga a perder 2 niveles y un tesoro 2 manos visibles',2,[TreasureKind::BOTHHANDS],[])
      @unusedMonsters<< Monster.new('Roboggoth', 8, bad_consequence, prize, 0)

      prize = Prize.new(1,1)
      bad_consequence = 
      SpecificBadConsequence.new('Te asustan en la noche. Pierdes un casco visible',0,[TreasureKind::HELMET],[])
      @unusedMonsters<< Monster.new('El espia', 5, bad_consequence, prize, 0)

      prize = Prize.new(1,1)
      bad_consequence = 
      NumericBadConsequence.new('Menudo susto te llevas. Pierdes 2 niveles y 5 tesoros visibles',2,5,0)
      @unusedMonsters<< Monster.new('El Lenguas', 20, bad_consequence, prize, 0)

      prize = Prize.new(1,1)
      bad_consequence = 
      SpecificBadConsequence.new('Te faltan manos para tanta cabeza. Pierdes 3 niveles y tus tesoros visibles de las manos',3,[TreasureKind::ONEHAND, TreasureKind::ONEHAND, TreasureKind::BOTHHANDS],[])
      @unusedMonsters<< Monster.new('Bicefalo', 20, bad_consequence, prize, 0)
      
      prize = Prize.new(3, 1)
      bad_consequence = 
      SpecificBadConsequence.new("Pierdes 1 mano visible.", 0, [TreasureKind::ONEHAND], [])
      @unusedMonsters << Monster.new("El mal indecible impronunciable", 10, bad_consequence, prize, -2)

      prize = Prize.new(2, 1)
      bad_consequence = 
        NumericBadConsequence.new("Pierder tus tesoros visibles. Jajaja", 0, 10, 0)
      @unusedMonsters << Monster.new("Testigos Oculares", 6, bad_consequence, prize, 2)

      prize = Prize.new(2, 5)
      bad_consequence = 
      DeathBadConsequence.new("Hoy no es tu dia de suerte. Mueres.",0,true)
      @unusedMonsters << Monster.new("El gran cthulhu", 20, bad_consequence, prize, 4)

      prize = Prize.new(2, 1)
      bad_consequence = 
      NumericBadConsequence.new("Tu gobierno te recorta 2 niveles.", 2, 0, 0)
      @unusedMonsters << Monster.new("Serpiente Politico", 8, bad_consequence, prize, -2)

      prize = Prize.new(1, 1)
      bad_consequence = 
      SpecificBadConsequence.new("Pierdes tu casco y tu armadura visible. Pierdes tus manos ocultas", 0, [TreasureKind::HELMET,  TreasureKind::ARMOR], [TreasureKind::ONEHAND, TreasureKind::ONEHAND,TreasureKind::BOTHHANDS])
      @unusedMonsters << Monster.new("Felpuggoth", 2, bad_consequence, prize, 5)

      prize = Prize.new(4, 2)
      bad_consequence = 
      NumericBadConsequence.new("Pierdes 2 niveles.", 2, 0, 0)
      @unusedMonsters << Monster.new("Shoggoth", 16, bad_consequence, prize, -4)

      prize = Prize.new(1, 1)
      bad_consequence = 
      NumericBadConsequence.new("Pintalabios negro. Pierdes 2 niveles.", 2, 0, 0)
      @unusedMonsters << Monster.new("Lolitagooth", 2, bad_consequence, prize, 3)
      
      
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
      initCultistCardDeck
    end
    
    def shuffleCultist
      @unusedCultists=@unusedCultist.shuffle
    end
    
    def initCultistCardDeck
      #@unusedCultists=Array.new
      @unusedCultists << Cultist.new("Sectario1", 1)
      @unusedCultists << Cultist.new("Sectario2", 2)
      @unusedCultists << Cultist.new("Sectario3", 1)
      @unusedCultists << Cultist.new("Sectario4", 2)
      @unusedCultists << Cultist.new("Sectario5", 1)
      @unusedCultists << Cultist.new("Sectario6", 1)
    end
    
    def nextCultist
      return nil
    end
  end
end
