class SourceMaterial < ApplicationRecord
  has_and_belongs_to_many :kits

  belongs_to :parent_source,
    class_name: 'SourceMaterial',
    foreign_key: 'parent_source_id',
    optional: true

  has_many :sub_sources,
    class_name: 'SourceMaterial',
    foreign_key: 'parent_source_id',
    inverse_of: :parent_source

  after_initialize :set_slug, unless: :slug_defined?
  before_validation :set_slug
  after_update :update_sub_source_slugs, if: :saved_change_to_slug?

  validates :name,
    presence: true,
    uniqueness: true
  validates :slug,
    presence: true,
    uniqueness: true
  validates :base_slug,
    presence: true,
    uniqueness: { scope: :parent_source }

  default_scope ->{ SourceMaterial.preload(:parent_source) }

  SLUG_DELIMITER = '/'

  def rebuild_slug!
    update(slug: construct_fully_qualified_slug)
  end

  def depth
    return 0 unless parent_source.present?

    parent_source.slug.split(SLUG_DELIMITER).count
  end

  private

  def set_slug
    self.slug = construct_fully_qualified_slug
  end

  def update_sub_source_slugs
    sub_sources.each(&:rebuild_slug!)
  end

  def construct_fully_qualified_slug
    return base_slug unless parent_source.present?

    [ parent_source.slug, base_slug ].join(SLUG_DELIMITER)
  end

  def slug_defined?
    slug.present?
  end
end
