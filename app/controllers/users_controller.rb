class UsersController < ApplicationController
  def create
    authentication = Authentication.new(
      ENV.fetch('CLIENT_ID'),
      ENV.fetch('CLIENT_SECRET'),
      user_params
    )

    user = authentication.authenticate_new_user
  end

  private

  def user_params
    # strong params validate your params 🐷
    params.require(:user).permit(:name, :email, :password)
  end
end
