class KitScale < ApplicationRecord
  has_many :kits

  validates :name, presence: true, uniqueness: true
  validates_numericality_of :denominator
end
