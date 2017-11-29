class UsersController < ApplicationController

  before_action :doorkeeper_authorize!, only: [:show]

  def create
    authentication = Authentication.new(
      ENV.fetch('CLIENT_ID'),
      ENV.fetch('CLIENT_SECRET'),
      user_params
    )

    user = authentication.authenticate_new_user

    # if user saved to the db, cool. Otherwise, respond with a 400
    if user.persisted?
      render json: user
    else
      render json: {error: user.errors.full_messages}, status: 400
    end
  end

  def show
    render json: current_user
  end

  def names
    users = User.where(id: params[:ids]).pluck(:id, :name).to_h

    render json: users
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :image)
  end
end
