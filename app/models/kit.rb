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

  has_many :kit_instances, dependent: :destroy
  accepts_nested_attributes_for :kit_instances

  STATUSES = KitInstance::STATUSES

  # Virtual attr to simplify logic of creating or not creating instances in creation form
  attr_accessor :persist_box

  before_validation :set_guid, unless: :persisted?

  validates :name, presence: true

  delegate :name, to: :kit_scale, prefix: true
  alias_method :scale_name, :kit_scale_name

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

  def handle
    elements = [
      name,
      kit_scale_name,
      kit_lines.map(&:nickname).then {|arr| arr.empty? ? nil : "[#{arr.join(', ')}]"},
      producers.pluck(:name).then {|arr| arr.empty? ? nil : "[#{arr.join(', ')}]"},
    ]
      .reject(&:blank?)

    elements.join(' ')
  end

  private

  def set_guid
    return if persisted? || self.guid.present?

    self.guid = "#{name.parameterize}__#{SecureRandom.uuid}"
  end
end
