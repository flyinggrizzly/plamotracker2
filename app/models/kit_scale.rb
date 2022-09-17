class KitScale < ApplicationRecord
  has_many :kits

  validates :name, presence: true, uniqueness: true
  validates_numericality_of :denominator

  scope :increasing, -> { order(denominator: 'asc') }
  scope :decreasing, -> { order(denominator: 'desc') }
end
