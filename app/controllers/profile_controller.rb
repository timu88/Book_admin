class ProfileController < ApplicationController
  def show
  end

  def edit
  end

  def update
    user = current_user
    user.update(params[:user])
  end

  private

  def user_params
    if current_user.admin?
      params.require(:user).permit(:name, :email, :admin)
    else
      params.require(:user).permit(:name, :email)
    end
  end

end
