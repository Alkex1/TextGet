# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

subjects = [
    { name: "Biology" },
    { name: "Chemistry" },
    { name: "Physics"},
    { name: "Maths" },
    { name: "History" }
]

# Creating subjects in database
if Subject.count == 0
    for subject in subjects
        subject = Subject.create(subject)

        puts "Created #{subject.name}"
    end
end

# making user data for database
if User.count == 0
    for i in 1..5 do
    usere = User.create(
        email: Faker::Internet.email,
        password: "blahblah"
    )
    puts "created #{usere}"
    end
end

# making textbook data for database
unless Textbook.count == 100
    for i in 1..20
        b = rand(1..User.all.count)
    # variable to take a user's id to assign it to a textbook.
        userx = User.find(b).id

        tbook = Textbook.create(
            name: Faker::Book.title,
            release_date: Faker::Date.between_except(from: 10.year.ago, to: 1.year.from_now, excepted: Date.today),
            author: Faker::Book.author,
            ISBN: Faker::Code.isbn,
            # ISBN: rand(1..10000000),
            condition: "good",
            price: rand(20..2000),
            retail_price: rand(50..5000),
            user_id: userx
        )
        puts "Made #{tbook}"

    end
end

# associating random Textbooks with random subjects for database
for i in 1..Textbook.count do
    x = rand(1..Textbook.count)
    y = rand(1..Subject.count)

    TextbooksSubject.create(textbook_id: x, subject_id: y)
end