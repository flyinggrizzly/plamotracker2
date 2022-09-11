module FactTable
  module Materials
    extend(self)
    extend(Table)

    NAMES = [
      "Resin",
      "Plastic",
      "Sofubi",
      "Wood",
      "White metal",
    ]

    def build
      NAMES.map {|name| [ name, Material.find_or_initialize_by(name:) ]}.to_h
    end
  end
end
