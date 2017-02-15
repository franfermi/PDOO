class Prize
  attr_reader :treasures, :level #Consultor GET
  
  def initialize(treasures, level)
    @treasures = treasures
    @level = level
  end
  
  def to_s
    "Niveles: #{@level} \n Premio: #{@treasures}"
  end
end
