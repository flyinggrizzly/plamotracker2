module FactTable
  module Producers
    extend(self)
    extend(Table)

    NAMES = [
      "Eduard",
      "Rainbow Egg",
      "Model Izakaya",
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
      "Elfin (Korean recaster c. 1992-1998)",
      "Utopia Cast",
      "Volks",
      "Wave",
      "e2046 Recast",
      "Good Smile Company",
      "MAX Factory",
      "Plum",
      "Dengeki Hobby",
      "Xiao Zhe - The Air Studio",
      "Nillson Work",
      "Novo Aircraft Kits",
      "SJL Model",
      "Garage Heavy Industry",
      "Makoto Models",
      "Honemits",
      "Andrea Miniatures",
      "Life Miniatures",
      "Atelier Sai",
      "Nitto",
      "Aoshima",
      "Platz",
      "Effect Wings",
      "Keiko Models",
      "Witching Hour",
      "Games Workshop",
      "B&K Models",
      "Molding Mule",
      "Tap and Dice (tap-and-dice.biz)",
      "Roppongi Hiroshi",
      "Big Child Creatives",
    ]

    def build
      NAMES.map {|name| [name, Producer.find_or_initialize_by(name:)]}.to_h
    end
  end
end
