require 'rails_helper'

RSpec.describe Book, type: :model do
  describe 'validations' do
    let(:valid_attributes) {
      {
        title: 'Test Book',
        author: 'John Doe',
        price: 29.99,
        published_date: Date.new(2024, 1, 1)
      }
    }

    it 'is valid with all attributes' do
      book = Book.new(valid_attributes)
      expect(book).to be_valid
    end

    it 'is invalid without a title' do
      book = Book.new(valid_attributes.merge(title: nil))
      expect(book).to_not be_valid
      expect(book.errors[:title]).to include("can't be blank")
    end

    it 'is invalid without an author' do
      book = Book.new(valid_attributes.merge(author: nil))
      expect(book).to_not be_valid
      expect(book.errors[:author]).to include("can't be blank")
    end

    it 'is invalid without a price' do
      book = Book.new(valid_attributes.merge(price: nil))
      expect(book).to_not be_valid
      expect(book.errors[:price]).to include("can't be blank")
    end

    it 'is invalid with a negative price' do
      book = Book.new(valid_attributes.merge(price: -10.00))
      expect(book).to_not be_valid
      expect(book.errors[:price]).to include("must be greater than or equal to 0")
    end

    it 'is invalid without a published date' do
      book = Book.new(valid_attributes.merge(published_date: nil))
      expect(book).to_not be_valid
      expect(book.errors[:published_date]).to include("can't be blank")
    end

    it 'is invalid with a future published date' do
      future_date = Date.today + 1.year
      book = Book.new(valid_attributes.merge(published_date: future_date))
      expect(book).to_not be_valid
      expect(book.errors[:published_date]).to include("can't be in the future")
    end
  end
end
