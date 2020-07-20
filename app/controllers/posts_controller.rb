class PostsController < ApplicationController
  before_action :authenticate_user
  before_action :set_post, only: [:show, :update, :destroy]

    def index
        posts = Post.all
        # posts = current_user.posts.order(id: "asc")
        render json: posts
    end

    def show 
      render json: @post
    end 

    def create
      # current_user.posts.create(post_params)
      # render json: "created post", status: :created
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
        # @post.update(post_params)
        # render json: "post updated", status: 200
        post = Post.find(params[:id])
        if post.update(post_params)
          render json: {}, status: :no_content
        else
          render json: { errors: post.errors.full_messages },
                 status: :unprocessable_entity
        end
      end
    
      def destroy
        # @post.destroy
        # render json: "post deleted", status: 200
        post = Post.find(params[:id])
        @post.delete
        render json: {}, status: :no_content
      end

      def authenticated_header
        user = create(:user)
      
        token = Knock::AuthToken.new(payload: {sub: user.id}).token
      
        { 'Authorization': "Bearer #{token}" }
      end
      
    
      private
    
      def post_params
        params.require(:post).permit(:title, :description, :image_url, :tag)
      end

      def set_post 
        @post = Post.find(params[:id])
      end 
    end
