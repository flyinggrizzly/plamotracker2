class KitScale < ApplicationRecord
  has_many :kits

  validates :name, presence: true, uniqueness: true

  scope :increasing, -> { order(denominator: 'asc') }
  scope :decreasing, -> { order(denominator: 'desc') }
end
