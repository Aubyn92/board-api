# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create( username: 'Harley', email: 'h@gmail.com', password: 'orange')
post = Post.create( title: "I love cookies", description: 'Man I love cookies', user_id: user.id )
post.tags.create(name: 'cooking')
# Post.create( title: "Board game help", description: 'What do I do', tag: "board games")
# Post.create( title: "Give me books to read", description: 'Need new books', tag: "books")
# Post.create( title: "Custom Keyboard help", description: 'Where is the best place to get custom parts', tag: "hobbies")
# Post.create( title: "I love cats", description: 'I love my cat', tag: "animals")
# Post.create( title: "Bonsai help", description: 'I\'ve been growing for a year and need help with cutting', tag: "hobbies")
