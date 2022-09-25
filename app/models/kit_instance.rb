class KitInstance < ApplicationRecord
  belongs_to :kit
  belongs_to :location, optional: true

  delegate :name, :guid, to: :kit, prefix: true
  delegate :name, :slug, to: :location, prefix: true, allow_nil: true

  STATUSES = {
    NEEDED: 0,
    DESIRED: 1,
    PURCHASED: 98,
    BEING_DELIVERED: 99,
    OWNED: 100, # default
    BUILT: 200,
    PARTED_OUT: 250,
    FOR_SALE: 301,
    SOLD: 300,
  }
  enum :status, STATUSES

  before_validation :set_guid, unless: :persisted?

  validates :guid, presence: true, uniqueness: { scope: :kit }

  default_scope -> { order(created_at: 'asc') }
  scope :persisted, -> { where.not(created_at: nil) }

  def status_name
    status&.humanize
  end

  private

  def set_guid
    return if persisted? || self.guid.present?

    self.guid = "#{kit_name.parameterize}--instance__#{SecureRandom.uuid}"
  end
end
