module FactTable
  module Designers
    extend(self)
    extend(Table)

    NAMES = [
      "Amazing Cast",
      "Anchoret",
      "Blue Knight",
      "Fine Molds",
      "Fortune Meow",
      "GM Dream",
      "Italeri",
      "Kaiyodo",
      "Kallamity",
      "Katoki Hajime",
      "Lab Zero",
      "Model Bingo",
      "Okawara Kunio",
      "Saito Heel",
      "Side3 The 51",
      "Square Enix Structure Arts",
      "Stickler Studio",
      "Studio Reckless",
      "Syd Mead",
      "Zoukei Mura",
      "Fujita Kazumi",
      "Kobayashi Makoto",
    ]

    def build
      NAMES.map {|name| [name, Designer.find_or_initialize_by(name:)]}.to_h
    end
  end
end
