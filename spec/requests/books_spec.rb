require 'rails_helper'

RSpec.describe "Books", type: :request do
  it "creates a book successfully and shows flash notice" do
    post books_path, params: { book: { title: "Amazing Turtles", author: "Jane Doe", price: 9.99, published_date: "2020-01-01" } }
    expect(response).to redirect_to(book_path(Book.last))
    follow_redirect!
    expect(response.body).to include("Book was successfully created.")
  end

  it "does not create a book without a title (rainy day)" do
    post books_path, params: { book: { title: "" } }
    expect(response).to have_http_status(:unprocessable_content)
    expect(Book.count).to eq(0)
  end

  it "does not create a book without an author" do
    post books_path, params: { book: { title: "Amazing Turtles", author: "" } }
    expect(response).to have_http_status(:unprocessable_content)
  end

  it "does not create a book without a price" do
    post books_path, params: { book: { title: "Amazing Turtles", price: nil } }
    expect(response).to have_http_status(:unprocessable_content)
  end

  it "does not create a book without a published_date" do
    post books_path, params: { book: { title: "Amazing Turtles", published_date: nil } }
    expect(response).to have_http_status(:unprocessable_content)
  end
end
