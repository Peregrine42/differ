class Page < ApplicationRecord
  validate :content_contains_valid_characters

  def content_contains_valid_characters
    unless content.match(/^[A-Za-z0-9_:", {}]+$/)
      errors.add(:content, 'Content may only contain: [A-Za-z0-9_:", {}]')
    end
  end
end
