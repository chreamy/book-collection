class Book < ApplicationRecord
  validates :title, presence: true
  validates :author, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :published_date, presence: { message: "can't be blank" }
  validate :published_date_cannot_be_in_future

  private

  def published_date_cannot_be_in_future
    if published_date.present? && published_date > Date.today
      errors.add(:published_date, "can't be in the future")
    end
  end
end