class KitLine < ApplicationRecord
  belongs_to :producer

  validates :name, presence: true, uniqueness: true
  validates :slug, presence: true, uniqueness: true

  before_validation :set_name_as_nickname_if_blank

  def nickname
    super || name
  end

  private

  def set_name_as_nickname_if_blank
    return if nickname.present?

    self.nickname = name
  end
end
