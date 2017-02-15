class Monster
  
  attr_reader :name, :combatLevel, :bc, :pc #Consultor GET

  def initialize(name, combatLevel, bc, pc)
    @name = name
    @combatLevel = combatLevel
    @bc = bc
    @pc = pc
  end
  
  def to_s
    "Nombre: #{@name} \n CombatLevel: #{@combatLevel} \n BadConsequence: #{@bc} \n Prize: #{@pc}"
  end
  
end
