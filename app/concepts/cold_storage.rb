module ColdStorage
  extend(self)

  def freeze
    data = Kit.all.map do |kit|
      {
        name: kit.name,
        guid: kit.guid,
        handle: kit.handle,
        notes: kit.notes,
        kit_scale: kit.kit_scale.name,
        kit_lines: kit.kit_lines.pluck(:slug),
        designers: kit.designers.pluck(:name),
        producers: kit.producers.pluck(:name),
        materials: kit.materials.pluck(:name),
        source_materials: kit.source_materials.pluck(:slug),
        kit_links: kit.kit_links.pluck(:guid),
        kit_instances: kit.kit_instances.pluck(:status, :notes).map {|status, notes| { status:, notes: }},
      }
    end

    Fs.write('kits', data)
  end

  def thaw
    FactTable.seed_all

    kit_data = Fs.read_latest('kits').sort_by {|kit| kit.fetch(:kit_links).size }

    starting_counts = [ Kit.count, KitInstance.count ]

    kit_data.each do |kit_datum|
      kit_datum => {
        name:,
        guid:,
        handle:,
        notes:,
        kit_scale: kit_scale_name,
        kit_lines: kit_line_slugs,
        designers: designer_names,
        producers: producer_names,
        materials: material_names,
        source_materials: source_material_slugs,
        kit_links: kit_link_guids,
        kit_instances:
      }

      kit_scale = KitScale.find_by(name: kit_scale_name)
      kit_lines = KitLine.where(slug: kit_line_slugs)
      designers = Designer.where(name: designer_names)
      producers = Producer.where(name: producer_names)
      materials = Material.where(name: material_names)
      source_materials = SourceMaterial.where(slug: source_material_slugs)
      kit_links = Kit.where(guid: kit_link_guids)

      kit = Kit.find_or_create_by(
        name:,
        guid:,
        handle:,
        notes:,
        kit_scale:
      )

      kit.kit_lines = kit_lines
      kit.designers = designers
      kit.producers = producers
      kit.source_materials = source_materials
      kit.materials = materials
      kit.kit_links = kit_links

      kit.save!

      kit.kit_instances.destroy_all

      kit_instances.each do |ki_datum|
        ki_datum => {
          status:,
          notes:,
        }

        kit.kit_instances.create(status:, notes:)
      end
    end

    ending_counts = [ Kit.count, KitInstance.count ]

    [ starting_counts, ending_counts ]
  end

  def prune(number_to_keep)
    Fs.prune(number_to_keep)
  end
end
