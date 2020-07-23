class CommentsController < ApplicationController

  def index
    # respond_with Comment.all
    @comment = Comment.all
    render json: {comments: comments}, status: 200 
  end
  
  def new
    @comment = Comment.new(post_id: params[:post_id])
  end
  
  def create
    # respond_with Comment.create(comment_params)
    @comment = Comment.new(commentParams)
    if @comment.save
      flash[:success] = "Comment successfully added"
      redirect_to comments_path(@comment)
    else
      render 'new'
    end
  end
  
  def show
    @comment = Comment.find(params[:id])
  end
  
  private
  
    def comment_params
      params.require(:comment).permit(:username, :comment, :post_id)
      # params.require(:comment).permit(:comment, :post_id, :username)
    end
  end
