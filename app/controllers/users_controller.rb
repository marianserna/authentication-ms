class UsersController < ApplicationController
  def create
    authentication = Authentication.new(
      ENV.fetch('APP_ID'),
      ENV.fetch('APP_SECRET'),
      user_params
    )
  end

  private

  def user_params
    # strong params validate your params 🐷
    params.require(:user).permit(:name, :email, :password)
  end
end
