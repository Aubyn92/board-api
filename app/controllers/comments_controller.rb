class CommentsController < ApplicationController

  def index
    @comment = Comment.all
    render json: {comments: comments}, status: 200 
  end
  
  def new
    @comment = Comment.new
  end
  
  def create
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
  
    def commentParams
      params.require(:comment).permit(:comment)
    end
  end
