class CommentsController < ApplicationController
  before_action :authenticate_user, only: [:create]

  # def index
  #   @post = Post.find(params[:post_id])
  #   posts = @post.comments.all
  #   render json: comments.as_json(
  #     only: [:body, :created_at],
  #     include: { user: { only: [:username] } }
  #   )
  # end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.commenter = current_user.email
    @comment.user_id = current_user.id
    @comment.save
    render json: @comment
    # redirect_to post_path(@post)
  end

  # def destroy
  #   @comment.destroy
  #   render json: {}, status: :no_content
  # end
 
  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end
