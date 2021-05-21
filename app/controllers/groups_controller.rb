class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy]
  def index
    @groups = Group.all
  end

  def new
    @tag_group = TagGroup.new
  end

  def create
    @tag_group = TagGroup.new(tag_group_params)
    if @tag_group.valid?
      @tag_group.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @group.update(group_params)
    render :show
  end

  def destroy
    @group.destroy
    redirect_to root_path
  end

  private

  def tag_group_params
    params.require(:tag_group).permit(:title, :details, :start_date, :end_date, :deadline_date, :max_num_of_people, tag_ids: []).merge(user_id: current_user.id)
  end

  def group_params
    params.require(:group).permit(:title, :details, :start_date, :end_date, :deadline_date, :max_num_of_people).merge(user_id: current_user.id)
  end

  def set_group
    @group = Group.find(params[:id])
  end

end
