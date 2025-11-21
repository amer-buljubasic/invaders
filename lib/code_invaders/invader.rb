module CodeInvaders
  class Invader
    NEBULA = [
      "--o-----o--",
      "---o---o---",
      "--ooooooo--",
      "-oo-ooo-oo-",
      "ooooooooooo",
      "o-ooooooo-o",
      "o-o-----o-o",
      "---oo-oo---"
    ].freeze

    STELLAR = [
      "---oo---",
      "--oooo--",
      "-oooooo-",
      "oo-oo-oo",
      "oooooooo",
      "--o--o--",
      "-o-oo-o-",
      "o-o--o-o"
    ].freeze

    UFO = [
      "--oo",
      "-----o",
      "-o--"
    ].freeze

    def self.all
      [NEBULA, STELLAR, UFO]
    end
  end
end
