class CommentsController < ApplicationController
  before_action :move_to_login_page
  before_action :move_to_show, only: [:destroy]

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

  def move_to_show
    group = Group.find(params[:group_id])
    if group.user != current_user
      redirect_to group_path(params[:group_id])
    end
  end
end
