class CommentsController < ApplicationController

  def create
    
  	comment = Comment.create(comment_params)
  	if params[:user_attributes][:username] != "new username"
  		new_user = User.create(new_user_params)
  		comment.user_id = new_user.id
  		comment.save
  		
  	end
    

    redirect_to comment.post
  end

  private
  
  def new_user_params
  	params.require(:user_attributes).permit(:username)
  end
  def comment_params
    params.require(:comment).permit(:content, :post_id, :user_id)
  end
end
