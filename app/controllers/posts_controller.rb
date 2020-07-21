class PostsController < ApplicationController
  before_action :authenticate_user
  before_action :set_post, only: %i[show update destroy update_image]

    def index
        posts = current_user.posts.with_attached_image
        # render json: { posts: posts, current_user: current_user.id }
        render json: { posts: generate_image_urls(posts), current_user: current_user.email }
    end

    def show 
      render json: @post
    end 

    def create
        post = current_user.posts.create(post_params)
        if post_params[:image]
          render json: { post: post, image: url_for(post.image) }, status: :created
        else
          render json: { post: post, image: '' }, status: created
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
          render json: {}, status: :no_content
        else
          render json: { errors: post.errors.full_messages },
                 status: :unprocessable_entity
        end
      end
    
      def destroy
        post = Post.find(params[:id])
        @post.delete
        render json: {}, status: :ok
      end

      def authenticated_header
        user = create(:user)
        token = Knock::AuthToken.new(payload: {sub: user.id}).token
        { 'Authorization': "Bearer #{token}" }
      end
      
    
      private
    
      def post_params
        params.require(:post).permit(:title, :description, :image, :tag)
      end

      def set_post 
        @post = Post.find(params[:id])
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
