# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
module NapakalakiRuby

  class Prize
    attr_reader :treasures, :levels

    #este es el contructor por defecto
    def initialize(treasure, level)
      @treasures=treasure
      @levels=level
    end

    def to_s
      "Treasures: #{@treasures} Levels: #{@levels}"
    end
  end
end
