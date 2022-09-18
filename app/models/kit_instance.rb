class KitInstance < ApplicationRecord
  belongs_to :kit

  STATUSES = {
    NEEDED: 0,
    DESIRED: 1,
    OWNED: 100, # default
    BUILT: 200,
    PARTED_OUT: 250,
    FOR_SALE: 301,
    SOLD: 300,
  }
  enum :status, STATUSES

  default_scope -> { order(created_at: 'asc') }
  scope :persisted, -> { where.not(created_at: nil) }

  def status_name
    status&.humanize
  end
end
