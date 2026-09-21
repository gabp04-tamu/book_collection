# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

Book.create!([
  { title: "The life of a turtle", author: "Jay Rasmuson", price: 60.99, published_date: "2026-09-21" },
  { title: "The light in the mirror", author: "Pihvala Silva", price: 45.64, published_date: "2026-09-21" },
  { title: "Communist test for household pets", author: "Gabriel D. Turung", price: 19.99, published_date: "2026-09-21" },
  { title: "Origami for Cats", author: "Mia Chen", price: 7.25, published_date: "2019-11-11" },
  { title: "The Weight of a Hundred Kilograms", author: "Sam Lee", price: 19.99, published_date: "2022-08-05" }
])
