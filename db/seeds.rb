# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Book.destroy_all
Comment.destroy_all

u1 = User.create(username: 'kyle', password_digest: 'sleepy')
u2 = User.create(username: 'annie', password_digest: 'horsies')

b1 = Book.create(title: 'players handbook', author: 'nerds', )
b2 = Book.create(title: 'captain bluebear', author: 'a blue bear')

c1 = Comment.create(body: 'nice book', user_id: User.first.id, book_id: Book.first.id )