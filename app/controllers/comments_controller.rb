class CommentsController < ApplicationController
  def create
    @comment =Comment.create(text: params[:comment][:text], shelf_id: params[:shelf_id], user_id: current_user.id)
    if @comment.save
       flash[:success] = "コメントを投稿しました。"
      redirect_to :back
    else
      flash.now[:alert] = "メッセージを入力してください。"
      redirect_to :back
    end
  end
end
