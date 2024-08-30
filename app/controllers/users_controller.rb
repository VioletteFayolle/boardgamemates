class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[show]

  def show
    @user = User.find_by(username: params[:username])
    @display = super_current_user?(@user)
  end

  def my_inscriptions
    @requests = current_user.requests.where(status: "En attente")
    @processed_requests = current_user.requests.where(status: ["Validée", "Rejetée"])

    @inscriptions = current_user.inscriptions.where(status: "En attente")
    @processed_inscriptions = current_user.inscriptions.where(status: ["Validée", "Rejetée"])
  end

  def my_events
    @my_events = current_user.my_events
    @events = current_user.events
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to user_path(@user.username), notice: 'Profile image updated successfully.'
    else
      render :edit
    end
  end

  private

  def super_current_user?(user)
    user == current_user ? "" : "d-none"
  end

  def user_params
    params.require(:user).permit(:photo)
  end
end
