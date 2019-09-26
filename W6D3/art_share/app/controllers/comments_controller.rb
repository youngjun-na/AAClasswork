class CommentsController < ApplicationController
  def create
    comment = Comment.new(comment_params)
    if comment.save
      render json: comment
    else         
      render json: comment.errors.full_messages, status: 422
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    render json: comment
  end

  def index 
    if params[:user_id]
       user = User.find(params[:user_id])
       user_comments = user.comments
       render json: user_comments
    else 
      artwork = Artwork.find(params[:artwork_id])
      artwork_comments = artwork.comments
      render json: artwork_comments
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:user_id, :artwork_id, :body)
  end

end
