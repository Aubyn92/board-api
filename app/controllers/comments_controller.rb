class CommentsController < ApplicationController
    def index
        comments = Comment.all
        render json: {comments: comments}, status: 200 
      end
end
