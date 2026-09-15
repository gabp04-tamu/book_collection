require 'rails_helper'

RSpec.describe Book, type: :model do
  it "is valid with a title, author, price, and published_date" do
    book = Book.new(title: "Amazing Turtles", author: "Jane Doe", price: 9.99, published_date: "2020-01-01")
    expect(book).to be_valid
  end

  it "is invalid without a title" do
    book = Book.new(title: nil, author: "Jane Doe", price: 9.99, published_date: "2020-01-01")
    expect(book).to_not be_valid
  end

  it "is invalid without an author" do
    book = Book.new(title: "Amazing Turtles", author: nil, price: 9.99, published_date: "2020-01-01")
    expect(book).to_not be_valid
  end

  it "is invalid without a price" do
    book = Book.new(title: "Amazing Turtles", author: "Jane Doe", price: nil, published_date: "2020-01-01")
    expect(book).to_not be_valid
  end

  it "is invalid without a published_date" do
    book = Book.new(title: "Amazing Turtles", author: "Jane Doe", price: 9.99, published_date: nil)
    expect(book).to_not be_valid
  end
end
