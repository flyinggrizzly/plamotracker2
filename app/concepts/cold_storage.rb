module ColdStorage
  extend(self)

  def freeze
    location_data = Location.all.map do |location|
      {
        name: location.name,
        slug: location.slug,
      }
    end

    kit_data = Kit.all.map do |kit|
      {
        name: kit.name,
        guid: kit.guid,
        notes: kit.notes,
        kit_scale: kit.kit_scale.name,
        kit_lines: kit.kit_lines.pluck(:slug),
        designers: kit.designers.pluck(:name),
        producers: kit.producers.pluck(:name),
        materials: kit.materials.pluck(:name),
        source_materials: kit.source_materials.pluck(:slug),
        kit_links: kit.kit_links.pluck(:guid),
      }
    end

    kit_instance_data = KitInstance.all.map do |ki|
      {
        kit: ki.kit_guid,
        status: ki.status,
        notes: ki.notes,
        location: ki.location_slug,
      }
    end

    data = { kits: kit_data, kit_instances: kit_instance_data, locations: location_data }

    Fs.write('kits', data)
  end

  def thaw
    FactTable.seed_all

    data = Fs.read_latest('kits')
    location_data = data.fetch(:locations)
    kit_data = data.fetch(:kits).sort_by {|kit| kit.fetch(:kit_links).size }
    kit_instance_data = data.fetch(:kit_instances)

    starting_counts = [ Kit.count, KitInstance.count, Location.count ]

    location_data.each do |loc_datum|
      loc_datum => { name:, slug: }

      Location.create(name:, slug:)
    end

    kit_data.each do |kit_datum|
      kit_datum => {
        name:,
        guid:,
        notes:,
        kit_scale: kit_scale_name,
        kit_lines: kit_line_slugs,
        designers: designer_names,
        producers: producer_names,
        materials: material_names,
        source_materials: source_material_slugs,
        kit_links: kit_link_guids,
      }

      kit_scale = KitScale.find_by(name: kit_scale_name)
      kit_scale_id = kit_scale.id
      kit_lines = KitLine.where(slug: kit_line_slugs)
      designers = Designer.where(name: designer_names)
      producers = Producer.where(name: producer_names)
      materials = Material.where(name: material_names)
      source_materials = SourceMaterial.where(slug: source_material_slugs)
      kit_links = Kit.where(guid: kit_link_guids)

      kit = Kit.find_or_initialize_by(
        name:,
        guid:,
        notes:,
        kit_scale_id:,
      )

      kit.kit_lines = kit_lines
      kit.designers = designers
      kit.producers = producers
      kit.source_materials = source_materials
      kit.materials = materials
      kit.kit_links = kit_links

      kit.save!
    rescue ActiveRecord::RecordNotUnique => e
      binding.pry
    end

    kit_instance_data.each do |instance|
      instance => {
        kit: kit_guid,
        status:,
        notes:,
        location: location_slug,
      }

      kit = Kit.find_by(guid: kit_guid)
      location = Location.find_by(slug: location_slug)

      KitInstance.find_or_create_by(
        kit:,
        status:,
        notes:,
        location:
      )
    end

    ending_counts = [ Kit.count, KitInstance.count, Location.count ]

    [ starting_counts, ending_counts ]
  end

  def prune(number_to_keep)
    Fs.prune(number_to_keep)
  end
end
