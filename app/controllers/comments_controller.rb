class CommentsController < ApplicationController
  def create
    comment = Comment.new(comment_params)
    if comment.valid?
      comment.save
    end
    redirect_to group_path(params[:group_id])
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    redirect_to group_path(params[:group_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, group_id: params[:group_id])
  end
end
