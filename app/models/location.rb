class Location < ApplicationRecord
  has_many :kit_instances
  has_many :kits, through: :kit_instances

  validates :name, presence: true, uniqueness: true
  validates :slug, presence: true, uniqueness: true

  before_validation :set_slug

  private

  def set_slug
    return unless name_changed? || !persisted?

    self.slug = name&.parameterize
  end
end
