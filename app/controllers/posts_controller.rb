class PostsController < ApplicationController
  before_action :authenticate_user, only: [:edit, :delete]
  before_action :set_post, only: %i[show update destroy update_image]

    def index
        posts = Post.all.with_attached_image
        posts_with_comments = posts.map do |post|
          comments = post.comments
          if post.image.attached?
             post.attributes.merge(comments: comments, image: url_for(post.image))
          else
             post.attributes.merge(comments: comments)
          end
        end
        render json: { posts: posts_with_comments }
    end

    def show 
        render json: {post: @post, comments: @post.comments}
    end 

    def create
        post = current_user.posts.create(post_params)
        if post_params[:image]
          render json: { post: post, image: url_for(post.image) }, status: :created
        else
          render json: { post: post, image: '' }, status: :created
        end
      end

      def update
        if @post.update(post_params)
        render json: 'post updated', status: :ok
        else
          render json: { errors: @post.errors.full_messages },
                 status: :unprocessable_entity
        end
      end
    
      def destroy
        @post.destroy
        render json: 'post deleted', status: :ok
      end

      def update_image
        @post.image.purge
        @post.image.attach(post_params[:image])
        render json: url_for(@post.image)
      end

      def generate_seeds
        create_users
        params[:images].each_with_index do |image, index|
          post = Post.create(posts_data[index])
          post.image.attach(image)
        end
        comments_data.each do |comment|
          Comment.create(comment)
        end
        render json: "finished seeding"
      end
    
      private

      def authorize_user
        if @post.user_id == current_user.id
          return true
        else
          return false
      end
    end
    
      def post_params
        params.require(:post).permit(:title, :description, :image, :tag, :like)
      end

      def set_post 
        @post = Post.find(params[:id])
      end

      def generate_image_urls(posts)
        posts.map do |post|
          original_post = Post.find(post["id"])
          if original_post.image.attached?
            post[:image] = url_for(original_post.image) 
          else
            post
          end
        end
      end

      def posts_data
        [
          { title: "Javascript help!!!!", tag: "Self-expression", description: "I've been learning JavaScript in this bootcamp for heavens knows how long and I just want out please.. help me I'm slowly going insane, I now have bald patches in my head and cry daily.", user_id: 1},
          { title: "Bob is my uncle", tag: "Venting", description: "I am so sick of people saying bob is THEIR uncle when he is actually not, it is the most infuriating thing in the world, I swear to god the next time I hear somebody say it  will screeck in their face", user_id: 1},
          { title: "I love cookies", tag: "Cooking", description: 'Man I love cookies', user_id: 1 },
          { title: "Give me books to read", tag: "Reading", description: 'Need new books', user_id: 1},
          { title: "Custom Keyboard help", tag: "Gaming", description: "Where is the best place to get custom parts", user_id: 2},
          { title: "I love cats", tag: "Self-expression", description: "I love my cat", user_id: 2},
          { title: "Bonsai help", tag: "Gardening", description: "I've been growing for a year and need help with cutting, this is my first time re-doing the wiring and could really use some tips on any things I should keep in the back of my mind while I do it", user_id: 1},
          { title: "Board game help", tag: "Games", description: "Hi Board community, I've started to get into board games during quarantine and was wondering if there was any online sites that emulate board games so I can play at my home without risking exposing myself to covid", user_id: 2},
          { title: "Maple table", tag: "Woodworking", description: "Hey guys I've been making this maple table for awhile and am super proud of my progress! Let me know if you have any cool tips!", user_id: 1},
          { title: "Easy meals to make at home", tag: "Cooking", description: "Hey guys I'm a young adult living in a rental at the moment and because work has stopped flowing I need to save in some ways and was thinking about getting into cooking! I would love to start simple and gradually build my way up. Please give me any suggestions you have.", user_id: 2},
          { title: "Help me", tag: "Education", description: "Hi I'm a single mum at home and now that school is on hold I need to help my child with his learning and was hoping to get some help with maths and english in particular. He is in prep and I wanted to help him learn his times tables during this time", user_id: 2}
        ]
      end

      def comments_data
        [
          { body: "Where to begin??? Have you tried crying loudly, I've found my room mates will then try to help me but usually they just end up crying too!!", post_id: 1, user_id: 1 },
          { body: "Bobs your uncle", post_id: 2, user_id: 1 },
          { body: "Me too!!", post_id: 3, user_id: 1 },
          { body: "Pragmatic Programmer!!! Do it.", post_id: 4, user_id: 1 },
          { body: "One site that is really interesting is Keycult, they sell custom parts at a premium but are definitely worth it! hope this helps.", post_id: 5, user_id: 1 },
          { body: "How wonderful.", post_id: 6, user_id: 1 },
          { body: "Is that the tiny plants??", post_id: 7, user_id: 1},
          { body: "Town of Salem is an online game that is sorta similar to board games and is fun to play with friends.", post_id: 8, user_id: 1 }, 
          { body: "Looks awesome!!", post_id: 9, user_id: 1 },
          { body: "Shakshouka. The best dish ever!!!! Hearty and tasty.", post_id: 10, user_id: 1},
          { body: "Hi, primary school teacher here! Kids brains as you know are like sponges so no matter what you do as long as you are putting effort in daily I'm sure he will improve! One way in which people remember things are in song and there are a couple times table songs on youtube that will really help.", post_id: 11, user_id: 1}
        ]
      end

      def create_users
        User.create( username: 'Harley', email: 'H@gmail.com', password: 'orange')
        User.create( username: 'James', email: 'J@gmail.com', password: 'pears')
      end
    end

