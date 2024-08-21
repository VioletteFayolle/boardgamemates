class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[show]
  skip_after_action :verify_authorized, only: %i[show]
  def show
    @user = User.find_by(username: params[:username])
  end
end
