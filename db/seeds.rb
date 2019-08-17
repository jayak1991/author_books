# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
if Author.count == 0
  100.times do
    author = Author.create(
              name: Faker::Book.unique.author,
              author_bio: Faker::Lorem.paragraph,
              academics: Faker::Educator.degree,
              awards: Faker::Superhero.name
    )
    author.profile_pic.attach(io: open(Faker::Avatar.image(slug: "my-own-slug", size: "50x50", format: "jpg")),
                              filename: 'my-own-slug.jpg',  content_type: 'image/png')
  end
end

if Book.count == 0
  genres = ["Science fiction", "Satire", "Drama", "Action and Adventure", "Romance", "Mystery", "Horror", "Self help", "Fantasy"]
  500.times do
    begin
      name = Faker::Book.unique.title
    rescue Exception => e
      Faker::Book.unique.clear
      name = Faker::Book.unique.title
    end
    book = Book.create(
        name_of_book: name,
        short_description: Faker::Books::Dune.quote,
        long_description: Faker::Lorem.paragraph,
        book_chapter_index: Faker::Number.decimal_part(digits: 2),
        date_of_publication: Faker::Date.between_except(from: 5.year.ago, to: Date.today, excepted: Date.today),
        genre: genres.sample(rand(genres.length + 1))
    )
    offset = rand(Author.count)
    rand_record = Author.offset(offset).first
    book.authors << rand_record unless book.authors.include? rand_record

    offset = rand(Author.count)
    rand_record = Author.offset(offset).first
    book.authors << rand_record unless book.authors.include? rand_record
  end
end

if Review.count == 0
  250.times do
    offset = rand(Book.count)
    rand_record = Book.offset(offset).first
    Review.create(
        name_of_reviewer: Faker::Name.name,
        star_rating: Faker::Number.between(from: 1, to: 5),
        review_title: Faker::Books::Dune.quote,
        review_description: Faker::Lorem.paragraph,
        book_id: rand_record.id
    )
  end
end


