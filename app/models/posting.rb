# frozen_string_literal: true

# Full Text Search with PG Search
# https://www.viget.com/articles/implementing-full-text-search-in-rails-with-postgres/
class Posting < ApplicationRecord
  include ActiveModel::Validations
  include PgSearch::Model

  after_validation :set_slug, only: %i[create update]

  validates :title, presence: true
  validates :posting_type, presence: true
  validates :headquarters, presence: true
  validates :how_to_apply, presence: true

  validates :coins, presence: true
  validates :category, presence: true, inclusion: { in: POSTING_CATEGORIES }
  validates :regional_restrictions, presence: true, inclusion: { in: REGIONAL_RESTRICTIONS }

  belongs_to :user

  has_rich_text :content

  pg_search_scope :search,
                  against: %i[title category],
                  associated_against: {
                    rich_text_content: [:body]
                  }

  def to_param
    "#{id}-#{slug}"
  end

  private

  def set_slug
    self.slug = title.to_s.parameterize
  end
end
