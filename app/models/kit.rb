class Kit < ApplicationRecord
  has_and_belongs_to_many :designers
  has_and_belongs_to_many :kit_lines
  has_and_belongs_to_many :materials
  has_and_belongs_to_many :producers
  has_and_belongs_to_many :source_materials
  has_and_belongs_to_many :kit_links,
    class_name: "Kit",
    join_table: "kit_links",
    foreign_key: "kit_linked_from_id",
    association_foreign_key: "kit_linked_to_id"
  has_and_belongs_to_many :kit_back_links,
    class_name: "Kit",
    join_table: "kit_links",
    foreign_key: "kit_linked_to_id",
    association_foreign_key: "kit_linked_from_id"

  belongs_to :kit_scale

  belongs_to :base_kit,
    class_name: 'Kit',
    foreign_key: 'base_kit_id',
    optional: true
  has_many :derived_kits,
    class_name: 'Kit',
    foreign_key: 'base_kit_id',
    inverse_of: 'base_kit'

  has_many :kit_instances, dependent: :destroy
  accepts_nested_attributes_for :kit_instances

  STATUSES = KitInstance::STATUSES

  # Virtual attr to simplify logic of creating or not creating instances in creation form
  attr_accessor :persist_box

  before_validation :set_guid, unless: :persisted?
  before_validation :set_handle

  validates :name, presence: true
  validates :handle, presence: true

  delegate :name, to: :kit_scale, prefix: true
  alias_method :scale_name, :kit_scale_name

  delegate :name, to: :base_kit, prefix: true, allow_nil: true

  def material_names
    materials.pluck(:name)
  end

  def producer_names
    producers.pluck(:name)
  end

  def kit_line_names
    kit_lines.pluck(:name)
  end

  def quantity
    kit_instances.count
  end

  private

  def set_handle
    elements = [
      name,
      kit_scale.name,
      kit_lines.map(&:nickname).then {|arr| arr.empty? ? nil : "[#{arr.join(', ')}]"},
      producers.pluck(:name).then {|arr| arr.empty? ? nil : "[#{arr.join(', ')}]"},
    ]
      .reject(&:blank?)

    self.handle = elements.join(' ')
  end

  def set_guid
    return if persisted?

    self.guid = "#{name.parameterize}__#{SecureRandom.uuid}"
  end
end
