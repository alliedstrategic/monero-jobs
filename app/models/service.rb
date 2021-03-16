# frozen_string_literal: true

class Service < ApplicationRecord
  include PgSearch::Model

  after_validation :set_slug, only: %i[create update]

  validates :title, presence: true
  validates :how_to_contact, presence: true

  validates :coins, presence: true
  validates :category, presence: true, inclusion: { in: POSTING_CATEGORIES }

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
