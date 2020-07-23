class PostsController < ApplicationController
  before_action :authenticate_user, only: [:edit, :delete]
  before_action :set_post, only: %i[show update destroy update_image]
  before_action :authorize_user, only: [:update]

    def index
        posts = Post.all.with_attached_image
        render json: { posts: generate_image_urls(posts) }
    end

    def show 
      render json: @post
    end 

    def create
        post = current_user.posts.create(post_params)
        if post_params[:image]
          render json: { post: post, image: url_for(post.image) }, status: :created
        else
          render json: { post: post, image: '' }, status: :created
        end
      end

        # post = Post.new(post_params)
      #   post.user = current_user
      #   if post.save
      #     render json: {}, status: :created
      #   else
      #     render json: { errors: post.errors.full_messages }, 
      #            status: :unprocessable_entity
      #   end
      # end

      def update
        post = Post.find(params[:id])
        if post.update(post_params)
        render json: 'post updated', status: :ok
        else
          render json: { errors: post.errors.full_messages },
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
    
      private

      def authorize_user
        if @post.user_id == current.user_id
          return true
        else
          return false
      end
    end
    
      def post_params
        params.require(:post).permit(:title, :description, :image, :tag)
      end

      def set_post 
        @post = Post.find(params[:id])
        if @post == nil
          redirect_to posts_path
      end 
    end

      def generate_image_urls(posts)
        posts.map do |post|
          if post.image.attached?
            post.attributes.merge(image: url_for(post.image))
          else
            post
          end
        end
      end
    end
