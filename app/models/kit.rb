class Kit < ApplicationRecord
  has_and_belongs_to_many :designers
  has_and_belongs_to_many :kit_lines
  has_and_belongs_to_many :materials
  has_and_belongs_to_many :producers
  has_and_belongs_to_many :source_materials

  belongs_to :kit_scale

  belongs_to :base_kit,
    class_name: 'Kit',
    foreign_key: 'base_kit_id',
    optional: true
  has_many :derived_kits,
    class_name: 'Kit',
    foreign_key: 'base_kit_id',
    inverse_of: 'base_kit'

  STATUSES = {
    NEEDED: 0,
    DESIRED: 1,
    OWNED: 100, # default
    BUILT: 200,
    PARTED_OUT: 250,
    SOLD: 300,
  }
  enum :status, STATUSES

  before_validation :set_identifier

  validates :name, presence: true
  validates :identifier,
    presence: true,
    uniqueness: { message: "Kit must be unique in the scope of scale, producers, kit-lines, designers, and base-kit" }

  private

  def set_identifier
    # Order is important and needs to be stable. Change with care.
    elements = [
      [ "name", name ],
      [ "scale", kit_scale.name ],
      [ "designers", designers.map(&:name) ],
      [ "producers", producers.map(&:name) ],
      [ "kit_lines", kit_lines.map(&:slug) ],
      [ "base_kit", base_kit&.identifier ],
    ]
      .reject {|_field, value| value.blank?}
      .map {|field, value| "#{field}={#{value}}"}

    self.identifier = elements.join(',')
  end
end
