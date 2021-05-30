class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  before_action :move_to_login_page
  before_action :move_to_show, only: [:edit, :update]

  def index
    @users = User.all
  end

  def show
  end

  def edit
  end

  def update
    @user.update(user_params)
    render :show
  end

  private

  def user_params
    params.require(:user).permit(:nickname)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def move_to_show
    if @user != current_user
      redirect_to user_path(@user.id)
    end
  end
end
