class PostsController < ApplicationController
  before_action :authenticate_user, only: %i[create]
    def index
        posts = Post.All
        render json: { posts: posts }
    end

    def create
        post = Post.new(post_params)
        trail.user = current_user
        if post.save
          render json: {}, status: :created
        else
          render json: { errors: post.errors.full_messages }, 
                 status: :unprocessable_entity
        end
      end
    
      private
    
      def post_params
        params.require(:post).permit(:title, :description)
      end
    end
