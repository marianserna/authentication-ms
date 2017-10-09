class SessionsController < ApplicationController
  def create
    # raise params.inspect
    authentication = Authentication.new(
      ENV.fetch('CLIENT_ID'),
      ENV.fetch('CLIENT_SECRET'),
      session_params
    )

    user = authentication.authenticate_with_password

    if user
      render json: user
    else
      render json: {error: 'Invalid email or password'}, status: 400
    end
  end

  private

  def session_params
    # Doesn't need to be required: it isnt nested inside an object
    params.permit(:email, :password)
  end
end
