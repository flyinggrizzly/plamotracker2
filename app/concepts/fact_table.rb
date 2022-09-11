module FactTable
  extend(self)

  def seed_all
    Materials.persist!
    Designers.persist!
    Producers.persist!
    KitLines.persist! # depends on Producers.persist!
    KitScales.persist!
    SourceMaterials.persist!
  end
end
