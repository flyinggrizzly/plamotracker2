module FactTable
  module KitScales
    extend(self)
    extend(Table)

    DATA = [
      {:name=>"1/20", :nickname=>nil, :denominator=>20},
      {:name=>"1/32", :nickname=>nil, :denominator=>32},
      {:name=>"1/35", :nickname=>nil, :denominator=>35},
      {:name=>"1/48", :nickname=>nil, :denominator=>48},
      {:name=>"1/60", :nickname=>nil, :denominator=>60},
      {:name=>"1/72", :nickname=>nil, :denominator=>72},
      {:name=>"1/100", :nickname=>nil, :denominator=>100},
      {:name=>"1/144", :nickname=>nil, :denominator=>144},
      {:name=>"1/220", :nickname=>nil, :denominator=>220}
    ]

    def build
      DATA.map do |ks|
        ks => {
          name:,
          nickname:,
          denominator:
        }

        [name, KitScale.find_or_initialize_by(name:, nickname:, denominator:)]
      end
        .to_h
    end
  end
end
