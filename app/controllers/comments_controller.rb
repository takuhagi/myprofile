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
    
    
    if 
      @comments.update(check_params) #1いれる
      
      redirect_to users_path(id: current_user.id)
    else
      render root_path
    end
    
  end

  def create
    @comment = Comment.new(comment_params)
    @user = User.find(params[:user_id]) #メール用
    if @comment.save
      # コメント通知
      # if @comment.user_id != current_user.id
      #   ContactMailer.send_when_comment(@user).deliver
      # end
      redirect_back(fallback_location: users_path)
    else
      render root_path
    end
    if @comment.user_id == current_user.id #自身へのコメントに"1"
      @comment.update(check_params)
    end
  end

  def reply
    @comment = Comment.new(comment_params)
    @user = User.find(params[:user_id]) #メール用
    
    if @comment.save
      # コメント通知
      # if @comment.user_id != current_user.id
      #   ContactMailer.send_when_comment(@user).deliver
      # end
      redirect_back(fallback_location: users_path)
    else
      render root_path
    end
    if @comment.user_id == current_user.id #自身へのコメントに"1"
      @comment.update(check_params)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:user_id, :comment,:commenter_id,:reply_id).merge(user_id: (params[:user_id]), commenter_id: current_user.id, reply_id: params[:comment_id])
  end

  def check_params
    # params.permit(check:[])
    params.permit(:check).merge(check: "1")
  end
  def check0_params
    params.permit(:check).merge(check: "0")
  end
end
