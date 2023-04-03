class KitInstance < ApplicationRecord
  module Status
    NEEDED = 'NEEDED'
    DESIRED = 'DESIRED'
    PURCHASED = 'PURCHASED'
    WAREHOUSED = 'WAREHOUSED'
    PRE_OR_BACK_ORDERED = 'PRE_OR_BACK_ORDERED'
    BEING_DELIVERED = 'BEING_DELIVERED'
    OWNED = 'OWNED'
    BUILT = 'BUILT'
    PARTED_OUT = 'PARTED_OUT'
    FOR_SALE = 'FOR_SALE'
    SOLD = 'SOLD'

    PENDING_DELIVERY = [
      PURCHASED,
      PRE_OR_BACK_ORDERED,
      WAREHOUSED,
      BEING_DELIVERED,
    ]

    ALL = [
      NEEDED,
      DESIRED,
      PURCHASED,
      WAREHOUSED,
      PRE_OR_BACK_ORDERED,
      BEING_DELIVERED,
      OWNED,
      BUILT,
      PARTED_OUT,
      FOR_SALE,
      SOLD
    ]

    class << self
      def valid?(status)
        ALL.include?(status.upcase)
      end

      def normalize(status_or_statuses)
        statuses = Array(status_or_statuses)

        valid_statuses = statuses.map {|s| s.upcase if valid?(s)}.compact

        # If we received a scalar, return only that validated
        return valid_statuses.first if statuses != status_or_statuses

        valid_statuses
      end
    end
  end

  belongs_to :kit
  belongs_to :location, optional: true

  delegate :name, :guid, to: :kit, prefix: true
  delegate :name, :slug, to: :location, prefix: true, allow_nil: true

  STATUSES = {
    NEEDED: 0,
    DESIRED: 1,
    PRE_OR_BACK_ORDERED: 97,
    WAREHOUSED: 98,
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

  scope :by_status, ->(statuses) {
    if statuses.present?
      where(status: statuses)
    else
      all
    end
  }

  class << self
    def valid_status?(status)

    end
  end

  def status_name
    status&.humanize
  end

  private

  def set_guid
    return if persisted? || self.guid.present?

    self.guid = "#{kit_name.parameterize}--instance__#{SecureRandom.uuid}"
  end
end
