module ColdStorage
  extend(self)

  def freeze
    data = Kit.all.map do |kit|
      {
        name: kit.name,
        identifier: kit.identifier,
        handle: kit.handle,
        notes: kit.notes,
        kit_scale: kit.kit_scale.name,
        designers: kit.designers.pluck(:name),
        producers: kit.producers.pluck(:name),
        materials: kit.materials.pluck(:name),
        source_materials: kit.source_materials.pluck(:slug),
        kit_links: kit.kit_links.pluck(:identifier),
        kit_instances: kit.kit_instances.pluck(:status, :notes).map {|status, notes| { status:, notes: }},
      }
    end

    Fs.write('kits', data)
  end

  def thaw
    data = Fs.read_latest('kits')
  end

  def prune(number_to_keep)
    Fs.prune(number_to_keep)
  end
end
