module FactTable
  module Producers
    extend(self)
    extend(Table)

    NAMES = [
      "Amazing Cast",
      "B-Club",
      "Bandai",
      "Fine Molds",
      "Fortune Meow",
      "Hasegawa",
      "Italeri",
      "Kaiyodo",
      "Kallamity",
      "Kotobukiya",
      "Lab Zero",
      "LoveLoveGarden",
      "Model Bingo",
      "Motor King",
      "Revell",
      "SH Studio",
      "Side3 The 51",
      "Square Enix Structure Arts",
      "Stickler Studio",
      "Unknown Volks Recast",
      "Utopia Cast",
      "Volks",
      "Wave",
      "e2046 Recast",
    ]

    def build
      NAMES.map {|name| [name, Producer.find_or_initialize_by(name:)]}.to_h
    end
  end
end
