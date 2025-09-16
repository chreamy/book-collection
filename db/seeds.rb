# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
Book.create!([
  {
    title: "The Pragmatic Programmer",
    author: "Andrew Hunt",
    price: 42.99,
    published_date: Date.new(1999, 10, 20)
  },
  {
    title: "Eloquent Ruby",
    author: "Russ Olsen",
    price: 35.50,
    published_date: Date.new(2011, 2, 11)
  },
  {
    title: "Clean Code",
    author: "Robert C. Martin",
    price: 45.00,
    published_date: Date.new(2008, 8, 1)
  },
  {
    title: "Design Patterns",
    author: "Erich Gamma, Richard Helm, Ralph Johnson, John Vlissides",
    price: 55.25,
    published_date: Date.new(1994, 10, 31)
  },
  {
    title: "Ruby on Rails Tutorial",
    author: "Michael Hartl",
    price: 39.99,
    published_date: Date.new(2020, 5, 20)
  }
])

