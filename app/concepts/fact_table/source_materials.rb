module FactTable
  module SourceMaterials
    extend(self)
    extend(Table)

    DATA = [
      {:name=>"Gundam", :base_slug=>"gundam", :parent_source_slug=>nil},
      {:name=>"Star Wars", :base_slug=>"star_wars", :parent_source_slug=>nil},
      {:name=>"Attack of the Clones", :base_slug=>"clones", :parent_source_slug=>"star_wars"},
      {:name=>"Missing Link", :base_slug=>"missing_link", :parent_source_slug=>"gundam"},
      {:name=>"Code Fairy", :base_slug=>"code_fairy", :parent_source_slug=>"gundam"},
      {:name=>"0083 Stardust Memory", :base_slug=>"0083", :parent_source_slug=>"gundam"},
      {:name=>"Heavy Metal L-Gaim", :base_slug=>"l_gaim", :parent_source_slug=>nil},
      {:name=>"Gundam Sentinel", :base_slug=>"sentinel", :parent_source_slug=>"gundam"},
      {:name=>"Hello Kitty", :base_slug=>"hello_kitty", :parent_source_slug=>nil},
      {:name=>"F90", :base_slug=>"f90", :parent_source_slug=>"gundam"},
      {:name=>"Char's Counterattack", :base_slug=>"cca", :parent_source_slug=>"gundam"},
      {:name=>"CCA MSV", :base_slug=>"msv", :parent_source_slug=>"gundam/cca"},
      {:name=>"Beltorchika's Children", :base_slug=>"beltorchika", :parent_source_slug=>"gundam/cca"},
      {:name=>"MSV", :base_slug=>"msv", :parent_source_slug=>"gundam"},
      {:name=>"Unicorn", :base_slug=>"uc", :parent_source_slug=>"gundam"},
      {:name=>"Wing", :base_slug=>"wing", :parent_source_slug=>"gundam"},
      {:name=>"G-Saviour", :base_slug=>"g_saviour", :parent_source_slug=>"gundam"},
      {:name=>"SD Gundam", :base_slug=>"sd", :parent_source_slug=>"gundam"},
      {:name=>"Zeta", :base_slug=>"zeta", :parent_source_slug=>"gundam"},
      {:name=>"ZZ", :base_slug=>"zz", :parent_source_slug=>"gundam"},
      {:name=>"F91", :base_slug=>"f91", :parent_source_slug=>"gundam"},
      {:name=>"F91 MSV", :base_slug=>"msv", :parent_source_slug=>"gundam/f91"},
      {:name=>"Victory", :base_slug=>"victory", :parent_source_slug=>"gundam"},
      {:name=>"Zeta MSV", :base_slug=>"msv", :parent_source_slug=>"gundam/zeta"},
      {:name=>"Build Divers", :base_slug=>"build_divers", :parent_source_slug=>"gundam"},
      {:name=>"Turn A", :base_slug=>"turn_a", :parent_source_slug=>"gundam"},
      {:name=>"Gundam Wing: Glory of the Losers", :base_slug=>"glory", :parent_source_slug=>"gundam/wing"},
      {:name=>"Gundam Wing: Endless Waltz", :base_slug=>"ew", :parent_source_slug=>"gundam/wing"},
      {:name=>"Advance of Zeta", :base_slug=>"advance_of_zeta", :parent_source_slug=>"gundam"},
      {:name=>"Seed: Destiny", :base_slug=>"seed_destiny", :parent_source_slug=>"gundam"},
      {:name=>"00", :base_slug=>"00", :parent_source_slug=>"gundam"},
      {:name=>"Crossbone", :base_slug=>"crossbone", :parent_source_slug=>"gundam"},
      {:name=>"Evolve", :base_slug=>"evolve", :parent_source_slug=>"gundam"},
      {:name=>"Brain Powerd", :base_slug=>"brain_powerd", :parent_source_slug=>nil},
      {:name=>"Iron Blooded Orphans", :base_slug=>"ibo", :parent_source_slug=>"gundam"},
      {:name=>"SDW Heroes", :base_slug=>"sdw_heroes", :parent_source_slug=>"gundam"},
      {:name=>"Origin", :base_slug=>"origin", :parent_source_slug=>"gundam"},
      {:name=>"NT", :base_slug=>"nt", :parent_source_slug=>"gundam"},
      {:name=>"Cowboy Bebop", :base_slug=>"cowboy_bebop", :parent_source_slug=>nil},
      {:name=>"M-MSV", :base_slug=>"m_msv", :parent_source_slug=>"gundam"},
      {:name=>"Traitor to Destiny", :base_slug=>"traitor_to_destiny", :parent_source_slug=>"gundam/advance_of_zeta"},
      {:name=>"08 MS Team", :base_slug=>"08_ms_team", :parent_source_slug=>"gundam"},
      {:name=>"Stargazer", :base_slug=>"stargazer", :parent_source_slug=>"gundam/seed_destiny"},
      {:name=>"Five Star Stories", :base_slug=>"fss", :parent_source_slug=>nil},
      {:name=>"Revival of Zeon", :base_slug=>"revival_of_zeon", :parent_source_slug=>"gundam/cca"},
      {:name=>"Xenogears", :base_slug=>"xenogears", :parent_source_slug=>nil},
      {:name=>"Ghost in the Shell", :base_slug=>"ghost_in_the_shell", :parent_source_slug=>nil},
      {:name=>"Armored Core", :base_slug=>"armored_core", :parent_source_slug=>nil},
      {:name=>"Metal Gear Solid", :base_slug=>"metal_gear_solid", :parent_source_slug=>nil},
      {:name=>"Frame Arms", :base_slug=>"frame_arms", :parent_source_slug=>nil},
      {:name=>"MaK", :base_slug=>"mak", :parent_source_slug=>nil},
      {:name=>"Robot Battle V", :base_slug=>"rbv", :parent_source_slug=>"mak"},
      {:name=>"AoZ: Reboot", :base_slug=>"reboot", :parent_source_slug=>"gundam/advance_of_zeta"},
      {:name=>"Aura Battler Dunbine", :base_slug=>"dunbine", :parent_source_slug=>nil},
      {:name=>"mechatrowego", :base_slug=>"mechatrowego", :parent_source_slug=>nil},
      {:name=>"Evangelion", :base_slug=>"evangelion", :parent_source_slug=>nil},
      {:name=>"Armor Trooper Votoms", :base_slug=>"votoms", :parent_source_slug=>nil},
      {:name=>"Abakan", :base_slug=>"abakan", :parent_source_slug=>nil}
    ].freeze

    def build
      data = DATA.map {|sm|
        sm => { parent_source_slug: }

        depth = if parent_source_slug.nil?
                  0
                else
                  parent_source_slug.split('/').count
                end

        sm.merge(depth: depth)
      }
        .sort_by {|sm| sm[:depth]}

      source_materials = {}

      data.map do |sm|
        sm => {
          name:,
          base_slug:,
          parent_source_slug:
        }

        parent_source = if parent_source_slug.nil?
                          nil
                        else
                          source_materials.fetch(parent_source_slug)
                        end

        sm = SourceMaterial.find_or_initialize_by(name:, base_slug:, parent_source:)

        source_materials[sm.slug] = sm
      end

      source_materials
    end
  end
end
