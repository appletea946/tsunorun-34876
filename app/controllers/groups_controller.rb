class GroupsController < ApplicationController
  def index
  end

  def new
    @group = Group.new
  end

  def create
    binding.pry
    @group = Group.new(group_params)
    if @group.valid?
      @group.save
      render :index
    else
      render :new
    end
  end

  def show
    
  end

  private

  def group_params
    params.require(:group).permit(:title, :details, :start_date, :end_date, :deadline_date, :max_num_of_people).merge(user_id: current_user.id)
  end
end
