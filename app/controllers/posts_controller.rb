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
    end
