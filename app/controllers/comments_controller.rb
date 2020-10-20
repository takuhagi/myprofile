class CommentsController < ApplicationController
  
  def show
    
    @user = User.find(params[:id])
    
    @comments = @user.comments.includes(:user).all
    @check = @comments.where(check: [nil]) #checkがNULLだけを表示
    
    
  end
  
  def update
    @user = User.find(params[:id])
    @comment = @user.comments.includes(:user).all #自分へのコメント取得
    @check = @comment.where(check: [nil]) #check、NULL取得
    @check.update(check0_params) #一旦全てに0
    @comments = Comment.where(id: params[:check_ids]) #チェックされたid
    
    # binding.pry
    if 
      @comments.update(check_params) #1いれる
      
      redirect_to root_path
    else
      render root_path
    end

  end

  def create
    @comment = Comment.new(comment_params)
    
    if @comment.save
      redirect_to root_path
    else
      render root_path
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:user_id, :comment,:commenter_id).merge(user_id: (params[:user_id]), commenter_id: current_user.id)
  end

  def check_params
    # params.permit(check:[])
    params.permit(:check).merge(check: "1")
  end
  def check0_params
    params.permit(:check).merge(check: "0")
  end
end
