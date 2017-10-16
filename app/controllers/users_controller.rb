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
      render json: user.errors, status: 400
    end
  end

  def show
    render json: current_user
  end

  private

  def user_params
    # strong params validate your params 🐷
    params.require(:user).permit(:name, :email, :password)
  end
end
