class UsersController < ApplicationController

  def update
    if @user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private
  def user_params
    params.require(:user).permit(:nickname, :email, :avatar)
  end
end
