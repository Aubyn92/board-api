class PostsController < ApplicationController
  before_action :authenticate_user, only: %i[create update destroy]
    def index
        posts = Post.All
        render json: { posts: posts }
    end

    def create
        post = Post.new(post_params)
        post.user = current_user
        if post.save
          render json: {}, status: :created
        else
          render json: { errors: post.errors.full_messages }, 
                 status: :unprocessable_entity
        end
      end

      def update
        post = Post.find(params[:id])
        if post.update(post_params)
          render json: {}, status: :no_content
        else
          render json: { errors: post.errors.full_messages },
                 status: :unprocessable_entity
        end
      end
    
      def destroy
        post = Post.find(params[:id])
        post.delete
        render json: {}, status: :no_content
      end
    
      private
    
      def post_params
        params.require(:post).permit(:title, :description)
      end
    end
