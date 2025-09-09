require 'rails_helper'

RSpec.feature "CreateBooks", type: :feature do
  scenario "creating a valid book with all attributes" do
    visit new_book_path
    
    fill_in "Title", with: "Test Book"
    fill_in "Author", with: "John Doe"
    fill_in "Price", with: "29.99"
    
    # Select date from dropdowns
    select "January", from: "book_published_date_2i"  # Month
    select "1", from: "book_published_date_3i"      # Day
    select "2024", from: "book_published_date_1i"   # Year
    
    click_button "Create Book"
    
    expect(page).to have_content("Book was successfully created")
    expect(current_path).to eq(books_path)
    expect(page).to have_content("Test Book")
    expect(page).to have_content("John Doe")
    expect(page).to have_content("$29.99")
    expect(page).to have_content("January 1, 2024")  # Updated to match the view format
  end

  scenario "trying to create a book without required attributes" do
    visit new_book_path
    click_button "Create Book"
    
    within("#error_explanation") do
      expect(page).to have_content("Title can't be blank")
      expect(page).to have_content("Author can't be blank")
      expect(page).to have_content("Price can't be blank")
      expect(page).to have_content("Price is not a number")
    end
  end

  scenario "trying to create a book with invalid price" do
    visit new_book_path
    
    fill_in "Title", with: "Test Book"
    fill_in "Author", with: "John Doe"
    fill_in "Price", with: "-10.00"
    
    # Select a valid date
    select "January", from: "book_published_date_2i"
    select "1", from: "book_published_date_3i"
    select "2024", from: "book_published_date_1i"
    
    click_button "Create Book"
    
    expect(page).to have_content("Price must be greater than or equal to 0")
  end

  scenario "trying to create a book with future published date" do
    visit new_book_path
    
    fill_in "Title", with: "Test Book"
    fill_in "Author", with: "John Doe"
    fill_in "Price", with: "29.99"
    
    current_year = Time.current.year
    
    # Select last day of current year
    select "December", from: "book_published_date_2i"
    select "31", from: "book_published_date_3i"
    select current_year.to_s, from: "book_published_date_1i"
    
    click_button "Create Book"
    
    expect(page).to have_content("Published date can't be in the future")
  end
end
