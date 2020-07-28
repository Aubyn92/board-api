class CommentsController < ApplicationController
  before_action :authenticate_user, only: [:create]

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.commenter = current_user.email
    @comment.save
    render json: @comment
  end
 
  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end
