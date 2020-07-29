pp "Creating Users"
user1 = User.create( username: 'Harley', email: 'H@gmail.com', password: 'orange')
user2 = User.create( username: 'James', email: 'J@gmail.com', password: 'pears')
pp "2 Users created"

pp "Creating Posts"
post1 = Post.create( title: "Javascript help!!!!", tag: "Self-expression", description: "I've been learning JavaScript in this bootcamp for heavens knows how long and I just want out please.. help me I'm slowly going insane, I now have bald patches in my head and cry daily.", user_id: user1.id)

post1.image.attach(
    io: File.open(Rails.root + "app/assets/images/help.png"),
    filename: 'help.png'
  )

post2 = Post.create( title: "Bob is my uncle", tag: "Venting", description: "I am so sick of people saying bob is THEIR uncle when he is actually not, it is the most infuriating thing in the world, I swear to god the next time I hear somebody say it  will screeck in their face", user_id: user2.id)

post2.image.attach(
    io: File.open(Rails.root + "app/assets/images/spongebob.jpg"),
    filename: 'spongebob.jpg'
  )

post3 = Post.create( title: "I love cookies", tag: "Cooking", description: 'Man I love cookies', user_id: user1.id )

post3.image.attach(
    io: File.open(Rails.root + "app/assets/images/cookies.jpg"),
    filename: 'cookies.jpg'
  )

post4 = Post.create( title: "Give me books to read", tag: "Reading", description: 'Need new books', user_id: user2.id)

post4.image.attach(
    io: File.open(Rails.root + "app/assets/images/midnight.jpg"),
    filename: 'midnight.jpg'
  )

post5 = Post.create( title: "Custom Keyboard help", tag: "Gaming", description: "Where is the best place to get custom parts", user_id: user2.id)

post5.image.attach(
    io: File.open(Rails.root + "app/assets/images/customk.jpg"),
    filename: 'customk.jpg'
  )

post6 = Post.create( title: "I love cats", tag: "Self-expression", description: "I love my cat", user_id: user1.id)

post6.image.attach(
    io: File.open(Rails.root + "app/assets/images/cats.jpg"),
    filename: 'cats.jpg'
  )

post7 = Post.create( title: "Bonsai help", tag: "Gardening", description: "I've been growing for a year and need help with cutting, this is my first time re-doing the wiring and could really use some tips on any things I should keep in the back of my mind while I do it", user_id: user2.id)

post7.image.attach(
    io: File.open(Rails.root + "app/assets/images/bonsai.jpg"),
    filename: 'bonsai.jpg'
  )

post8 = Post.create( title: "Board game help", tag: "Games", description: "Hi Board community, I've started to get into board games during quarantine and was wondering if there was any online sites that emulate board games so I can play at my home without risking exposing myself to covid", user_id: user1.id)

post8.image.attach(
    io: File.open(Rails.root + "app/assets/images/boardgame.jpg"),
    filename: 'boardgame.jpg'
  )

post9 = Post.create( title: "Maple table", tag: "Woodworking", description: "Hey guys I've been making this maple table for awhile and am super proud of my progress! Let me know if you have any cool tips!", user_id: user1.id)

post9.image.attach(
    io: File.open(Rails.root + "app/assets/images/maple.jpg"),
    filename: 'maple.jpg'
  )

post10 = Post.create( title: "Easy meals to make at home", tag: "Cooking", description: "Hey guys I'm a young adult living in a rental at the moment and because work has stopped flowing I need to save in some ways and was thinking about getting into cooking! I would love to start simple and gradually build my way up. Please give me any suggestions you have.", user_id: user1.id)

post10.image.attach(
    io: File.open(Rails.root + "app/assets/images/shak.jpg"),
    filename: 'shak.jpg'
  )

post11 = Post.create( title: "Help me", tag: "Education", description: "Hi I'm a single mum at home and now that school is on hold I need to help my child with his learning and was hoping to get some help with maths and english in particular. He is in prep and I wanted to help him learn his times tables during this time", user_id: user2.id)

post11.image.attach(
    io: File.open(Rails.root + "app/assets/images/home.jpg"),
    filename: 'home.jpg'
  )


pp "11 Posts created"
pp "Seed Completed"


Comment.create(body: "Where to begin??? Have you tried crying loudly, I've found my room mates will then try to help me but usually they just end up crying too!!", post_id: 1, user_id: 1 )
Comment.create(body: "Bobs your uncle", post_id: 2, user_id: 1 )
Comment.create(body: "Me too!!", post_id: 3, user_id: 1 )
Comment.create(body: "Pragmatic Programmer!!! Do it.", post_id: 4, user_id: 1 )
Comment.create(body: "One site that is really interesting is Keycult, they sell custom parts at a premium but are definitely worth it! hope this helps.", post_id: 5, user_id: 1 )
Comment.create(body: "How wonderful.", post_id: 6, user_id: 1 )
Comment.create(body: "Is that the tiny plants??", post_id: 7, user_id: 1 )
Comment.create(body: "Town of Salem is an online game that is sorta similar to board games and is fun to play with friends.", post_id: 8, user_id: 1 )
Comment.create(body: "Looks awesome!!", post_id: 9, user_id: 1 )
Comment.create(body: "Shakshouka. The best dish ever!!!! Hearty and tasty.", post_id: 10, user_id: 1)
Comment.create(body: "Hi, primary school teacher here! Kids brains as you know are like sponges so no matter what you do as long as you are putting effort in daily I'm sure he will improve! One way in which people remember things are in song and there are a couple times table songs on youtube that will really help.", post_id: 11, user_id: 1)


