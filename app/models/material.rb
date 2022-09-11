class Material < ApplicationRecord
  has_and_belongs_to_many :kits

  validates :name, presence: true, uniqueness: true
end
