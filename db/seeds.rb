# pp "Removing Old Records"
# User.destroy_all
# Post.destroy_all

pp "Creating Users"
user1 = User.create( username: 'Harley', email: 'H@gmail.com', password: 'orange')
user2 = User.create( username: 'James', email: 'J@gmail.com', password: 'pears')
user3 = User.create( username: 'Charles', email: 'C@gmail.com', password: 'pineapple')
user4 = User.create( username: 'Liv', email: 'L@gmail.com', password: 'potato')
user5 = User.create( username: 'Josh', email: 'JW@gmail.com', password: 'banana')
user6 = User.create( username: 'Harrison', email: 'HM@gmail.com', password: 'apple')
pp "6 Users created"

pp "Creating Posts"
post1 = Post.create( title: "I love cookies", description: 'Man I love cookies', user_id: user1.id )
post2 = Post.create( title: "Board game help", description: 'What do I do', user_id: user2.id)
post3 = Post.create( title: "Give me books to read", description: 'Need new books', user_id: user3.id)
post4 = Post.create( title: "Custom Keyboard help", description: 'Where is the best place to get custom parts', user_id: user4.id)
post5 = Post.create( title: "I love cats", description: 'I love my cat', user_id: user5.id)
post6 = Post.create( title: "Bonsai help", description: 'I\'ve been growing for a year and need help with cutting', user_id:user6.id)
pp "6 Posts created"
pp "Seed Completed"

# post.tags.create(name: 'cooking')
# post.tags.create(name: 'games')
# post.tags.create(name: 'reading')
# post.tags.create(name: 'games')
# post.tags.create(name: 'animals')
# post.tags.create(name: 'plants')

