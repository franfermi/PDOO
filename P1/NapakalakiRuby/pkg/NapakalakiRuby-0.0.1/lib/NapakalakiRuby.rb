#!/usr/bin/env ruby
#encoding: utf-8

require_relative 'BadConsequence.rb'
require_relative 'Monster.rb'
require_relative 'TreasureKind.rb'
require_relative 'Prize.rb'

#Función que devuelve una lista con los monstruos con nivel de combate > 10
def Mayor10(monstruos) #Se le pasa como parámetro una lista de monstruos
    lista=Array.new #Crea una nueva lista, en la que estarán los monstruos de nivel > 10
    monstruos.each { |mons| #Recorremos la lista monstruos, en mons se van guardando los monstruos
      if mons.Monster.combatLevel > 10
        lista << mons #Si tenemos un monstruo con un nivel de combate > 10, lo guardamos 
                      #en la nueva lista "lista"
      end
    }
    lista
end

def PerdidaNiveles(monstruos)
    lista=Array.new
    monstruos.each { |mons|
      if mons.BadConsequence.level > 0 && mons.BadConsequence.nHidden == 0 && mons.BadConsequence.nVisible == 0 && mons.BadConsequence.specificHiddenTreasures == nil && mons.BadConsequence.specificVisibleTreasures == nil
        lista << mons
      end
    }
    lista
end

def GanaciaNiveles(monstruos)
    lista=Array.new
    monstruos.each { |mons|
      if mons.Prize.level > 1
        lista << mons
      end
    }
    lista
end

def PerdidaTesoros(monstruos)
    lista=Array.new
    monstrous.each { |mons|
      if mons.BadConsequence.nVisible > 0 || mons.BadConsequence.nHidden > 0
        lista << mons
      end
    }
    lista
end


monster = Array.new
#///////////////////////////////////
prize = Prize.new(4, 2)
badConsequence = BadConsequence.newLevelNumberOfTreasures('Pierdes 5 niveles y 3 tesoros visibles.', 5, 3, 0)
monster << Monster.new('El rey de rosa', 13, badConsequence, prize)
#///////////////////////////////////
prize = Prize.new(4, 1)
badConsequence = BadConsequence.newLevelSpecificTreasures('Te atrapan para llevarte de fiesta y te dejan
    caer en mitad del vuelo. Descarta 1 mano visible y 1 mano oculta.', 0, [TreasureKind::ONEHAND], [TreasureKind::ONEHAND])
monster << Monster.new('Ángeles de la noche ibicenca', 14, badConsequence, prize)
#///////////////////////////////////
prize = Prize.new(2, 1)
badConsequence = BadConsequence.newLevelSpecificTreasures('Pierdes tu armadura visible y otra oculta.', 0, [TreasureKind::ARMOR], [TreasureKind::ARMOR])
monster << Monster.new('3 Byakhees de bonanza', 8, badConsequence, prize)
#///////////////////////////////////
prize = Prize.new(1, 1)
badConsequence = BadConsequence.newLevelSpecificTreasures('Embobados con el lindo primigenio te descartas de tu casco visible.', 0, [TreasureKind::HELMET], 0)
monster << Monster.new('Chimithulhu', 2, badConsequence, prize)
#///////////////////////////////////
prize = Prize.new(1, 1)
badConsequence = BadConsequence.newLevelSpecificTreasures('El primordial bostezo contagioso. Pierdes el calzado visible.', 0, [TreasureKind::SHOES], 0)
monster << Monster.new('El sopor de Dunwich.', 2, badConsequence, prize)
#///////////////////////////////////
prize = Prize.new(3, 1)
badConsequence = BadConsequence.newLevelNumberOfTreasures('Pierdes todos tus tesoros visibles.', 0, 3, 0)
monster << Monster.new('El gorrón en el umbral', 10, badConsequence, prize)
#///////////////////////////////////
prize = Prize.new(2, 1)
badConsequence = BadConsequence.newLevelSpecificTreasures('Pierdes la armadura visible.', 0, [TreasureKind::ARMOR], 0)
monster << Monster.new('H.P. Munchcraft', 6, badConsequence, prize)
#///////////////////////////////////
prize = Prize.new(1, 1)
badConsequence = BadConsequence.newLevelSpecificTreasures('Sientes bichos bajo la ropa. Descarta la armadura visible.', 0, [TreasureKind::ARMOR], 0)
monster << Monster.new('Bichgooth', 2, badConsequence, prize)
#///////////////////////////////////
prize = Prize.new(1, 1)
badConsequence = BadConsequence.newLevelNumberOfTreasures('Toses los pulmones y pierdes 2 niveles.', 2, 0, 0)
monster << Monster.new('La que redacta en las tinieblas', 2, badConsequence, prize)
#///////////////////////////////////
prize = Prize.new(2, 1)
badConsequence = BadConsequence.newDeath('Estos monstruos resultan bastante superficiales y te aburren mortalmente. Estas muerto.')
monster << Monster.new('Los hondos', 8, badConsequence, prize)
#///////////////////////////////////
prize = Prize.new(2, 1)
badConsequence = BadConsequence.newLevelNumberOfTreasures('Pierdes 2 niveles y 2 tesoros ocultos.', 2, 0, 2)
monster << Monster.new('Semillas Cthulhu', 4, badConsequence, prize)
#///////////////////////////////////
prize = Prize.new(2, 1)
badConsequence = BadConsequence.newLevelSpecificTreasures('Te intentas escaquear. Pierdes una mano visible.', 0, [TreasureKind::ONEHAND], 0)
monster << Monster.new('Dameargo', 1, badConsequence, prize)
#///////////////////////////////////
prize = Prize.new(1, 1)
badConsequence = BadConsequence.newLevelNumberOfTreasures('Da mucho asquito. Pierdes 3 niveles.', 3, 0, 0)
monster << Monster.new('Pollipólipo volante', 3, badConsequence, prize)
#///////////////////////////////////
prize = Prize.new(3, 1)
badConsequence = BadConsequence.newDeath('No le hace gracia que pronuncien mal su nombre. Estas muerto.')
monster << Monster.new('Yskhtihyssg-Goth', 12, badConsequence, prize)
#///////////////////////////////////
prize = Prize.new(4, 1)
badConsequence = BadConsequence.newDeath('La familia te atrapa. Estás muerto.')
monster << Monster.new('Familia feliz', 1, badConsequence, prize)
#///////////////////////////////////
prize = Prize.new(2, 1)
badConsequence = BadConsequence.newLevelSpecificTreasures('La quinta directiva primaria te obliga a perder 2 niveles y un tesoro 2 manos visible.', 2, [TreasureKind::BOTHHANDS], 0)
monster << Monster.new('Roboggoth', 8, badConsequence, prize)
#///////////////////////////////////
prize = Prize.new(1, 1)
badConsequence = BadConsequence.newLevelSpecificTreasures('Te asusta en la noche. Pierdes un casco visible.', 0, [TreasureKind::HELMET], 0)
monster << Monster.new('El espía', 5, badConsequence, prize)
#///////////////////////////////////
prize = Prize.new(1, 1)
badConsequence = BadConsequence.newLevelNumberOfTreasures('Menudo susto te llevas. Pierdes 2 niveles y 5 tesoros visibles', 2, 5, 0)
monster << Monster.new('El Lenguas', 20, badConsequence, prize)
#///////////////////////////////////
prize = Prize.new(1, 1)
badConsequence = BadConsequence.newLevelSpecificTreasures('Te faltan manos para tanta cabeza. Pierdes 3 niveles y tus tesoros visibles de las manos.', 3, [TreasureKind::BOTHHANDS], 0)
monster << Monster.new('Bicéfalo', 20, badConsequence, prize)
#///////////////////////////////////

  
