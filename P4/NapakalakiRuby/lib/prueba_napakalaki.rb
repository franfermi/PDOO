# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
#encoding: utf-8

  require_relative 'bad_consequence'
  require_relative 'monster'
  require_relative 'treasure_kind'
  require_relative 'prize'
 
module NapakalakiRuby 
  def Mayor10(monstruos)
    lista=Array.new
    monstruos.each{|mon| 
      if mon.combatLevel>10 
        lista<<mon
      end
    }
    lista
  end

  #Mostrar todos los monstruos que tengan un mal rollo que implique sólo pérdida de
  #niveles.
  def SoloPerdidasNiveles(monstruos)
    #lista=Array.new
    monstruos.each{|mon| 
      if mon.bc.Level > 0 && mon.bc.VisibleTreasures == nil && mon.bc.HiddenTreasures == 0 &&mon.bc.SpecificVisibleTreasures == nil && mon.bc.SpecificHiddenTreasures == nil    
        mon.to_s
        lista<<mon
      end
    }
    lista
  end

  #Mostrar todos los monstruos que tengan un buen rollo que indique una ganancia de
  #niveles superior a 1.


  def GananciasNivel1(monstruos)
    lista=Array.new
    monstruos.each{|mon| 
      if mon.pz.Level>1        
        lista<<mon  # esto es como hacer un .add  o un push back en c++. Hay otras dos formas pero esta es la mas facil y rapida
        mon.pz.to_s
      end
    }
    lista
  end


  #Mostrar todos los monstruos que tengan un mal rollo que suponga la pérdida de un
  #determinado tipo de tesoros ya sea visibles y/o ocultos.

  def PierdeTesorosVisiblesOcultos(monstruos)
    lista=Array.new
    monstruos.each{|mon| 
      if monstruo.bc.SpecificVisibleTreasures != nil || monstruo.bc.SpecificHiddenTreasures != nil         
        lista<<mon
      end
    }
    lista   # así se hace el return, solo poniendo lo que devuelve
  end

  monster = Array.new

      #1 Byakhees de bonanza
      prize = Prize.new(2,1)
      badconsequence = BadConsequence.newLevelSpecificTreasures('Pierdes tu armadura visible y otra oculta',0,[TreasureKind::ARMOR],[TreasureKind::ARMOR])
      monster<< Monster.new('3 Byakhees de bonanza',8, badconsequence, prize)

      #2-Chibithulhu
      prize = Prize.new(1,1)
      badconsequence = BadConsequence.newLevelSpecificTreasures('Embobados con el lindo primigenio te descartas de tu casco visible', 0, [TreasureKind::HELMET], Array.new)
      monster<< Monster.new('Chibithulhu',2, badconsequence, prize)

      #3-El sopor de Dunwich
      prize = Prize.new(1,1)
      badconsequence = BadConsequence.newLevelSpecificTreasures('El primordial bostezto contagioso. Pierdes el calzado visible',0,[TreasureKind::SHOES], Array.new)
      monster<< Monster.new('El sopor de Dunwich', 2,badconsequence, prize)

      #4-Angeles de la noche ibicenca
      prize = Prize.new(4,1)
      badconsequence = BadConsequence.newLevelSpecificTreasures('Te atrapan para llevarte de fiesta y te dejan caer en mitad del vuelo.Descarta 1 mano visible y 1 mano oculta', 0, [TreasureKind::ONEHAND], [TreasureKind::ONEHAND])
      monster<< Monster.new('Angeles de la noche ibicenca',14,badconsequence, prize)

      #5-El gorron en el umbral
      prize = Prize.new(3,1)
      badconsequence = BadConsequence.newLevelNumberOfTreasures('Pierdes todos tus tesoros visibles', 0, 10, 0)
      monster<< Monster.new('El gorron en el umbral', 10, badconsequence, prize)

      #6-H.P. Munchcraft
      prize = Prize.new(2,1)
      badconsequence = BadConsequence.newLevelSpecificTreasures('Pierdes la armadura visible', 0, [TreasureKind::ARMOR], Array.new)
      monster << Monster.new('H.P. Munchcraft', 6, badconsequence, prize)

      #7-Bichgooth
      prize = Prize.new(1, 1)
      badconsequence = BadConsequence.newLevelSpecificTreasures('Sientes bichos bajo la ropa', 0, [TreasureKind::ARMOR], Array.new)
      monster << Monster.new('Bichgooth', 2, badconsequence, prize)

      #8-El rey de la rosa
      prize = Prize.new(4,2)
      badconsequence = BadConsequence.newLevelNumberOfTreasures('Pierdes 5 niveles y 3 tesoros visibles',5,3,0)
      monster << Monster.new('El rey de la rosa', 13, badconsequence, prize)

      #9-La que redacta en las tinieblas
      prize = Prize.new(1,1)
      badconsequence = BadConsequence.newLevelNumberOfTreasures('Toses los pulmones y pierdes 2 niveles', 2, 0, 0)
      monster << Monster.new('La que redacta en las tinieblas', 2, badconsequence, prize)

      #10-Los hondos
      prize = Prize.new(2,1)
      badconsequence = BadConsequence.newDeath('Estos monstruos resultan bastante superficales y te aburren mortalmente. Estas muerto')
      monster << Monster.new('Los hondos',8,badconsequence, prize)

      #11-Semillas Cthulhu
      prize = Prize.new(2,1)
      badconsequence = BadConsequence.newLevelNumberOfTreasures('Pierdes 2 niveles y 2 tesoros ocultos', 2, 0, 2)
      monster << Monster.new('Semillas Cthulhu', 4, badconsequence,prize)

      #12-Dameargo
      prize = Prize.new(2,1)
      badconsequence = BadConsequence.newLevelSpecificTreasures('Te intentas escaquear. Pierdes una mano visible', 0, [TreasureKind::ONEHAND], 0)
      monster << Monster.new('Dameargo',1, badconsequence, prize)

      #13-Pollipolipo volante
      prize = Prize.new(1,1)
      badconsequence = BadConsequence.newLevelNumberOfTreasures('Da mucho asquito. Pierdes 3 niveles', 3, 0, 0)
      monster << Monster.new('Pollipolipo volante', 3, badconsequence,prize)

      #14-Yskhtihyssg-Goth
      prize = Prize.new(3,1)
      badconsequence = BadConsequence.newDeath('No le hace mucha gracia que pronuncien mal su nombre. Estas muerto')
      monster << Monster.new('Yskhtihyssg-Goth', 12, badconsequence,prize)

      #15-La familia feliz
      prize = Prize.new(4,1)
      badconsequence = BadConsequence.newDeath('La familia te atrapa. Estas muerto')
      monster << Monster.new('La familia feliz', 1, badconsequence,prize)

      #16-Roboggoth
      prize = Prize.new(2, 1)
      badconsequence = BadConsequence.newLevelSpecificTreasures('La quinta directiva primaria te obliga a perder 2 niveles y un tesoro de 2 manos visible', 2, [TreasureKind::BOTHHANDS], 0)
      monster << Monster.new('Roboggoth', 8, badconsequence, prize)

      #17-El espia
      prize = Prize.new(1, 1)
      badconsequence = BadConsequence.newLevelSpecificTreasures('Te asusta en la noche. Pierdes un casco visible', 0, [TreasureKind::HELMET], 0)
      monster << Monster.new('El espia', 5, badconsequence,prize)

      #18-El lenguas
      prize = Prize.new(1, 1)
      badconsequence = BadConsequence.newLevelNumberOfTreasures('Menudo susto te llevas. Pierdes 2 niveles y 5 tesoros visibles', 2, 5, 0)
      monster << Monster.new('El lenguas', 20, badconsequence, prize)

      #19-Bizefalo
      prize = Prize.new(1,1)
      badconsequence = BadConsequence.newLevelNumberOfTreasures('Te faltan manos para tanta cabeza. Pierdes 3 niveles y tus tesoros visibles de las manos', 3, 10, 0)
      monster << Monster.new('Bizefalo', 20, badconsequence, prize)
end



