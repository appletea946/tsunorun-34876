class UserGroupRelationsController < ApplicationController
  before_action :move_to_login_page

  def create
    user_group_relations = UserGroupRelation.new(user_id: current_user.id, group_id: params[:group_id])
    if user_group_relations.valid?
      user_group_relations.save
      redirect_to group_path(params[:group_id])
    else
      redirect_to group_path(params[:group_id])
    end
  end

  def destroy
    user_group_relations = UserGroupRelation.find_by(user_id: current_user.id, group_id: params[:group_id])
    if user_group_relations
      user_group_relations.destroy
    end
    redirect_to group_path(params[:group_id])
  end
end
