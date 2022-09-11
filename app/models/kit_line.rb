class KitLine < ApplicationRecord
  belongs_to :producer

  validates :name, presence: true, uniqueness: true
  validates :slug, presence: true, uniqueness: true

  def nickname
    super || name
  end
end
