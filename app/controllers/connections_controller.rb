class ConnectionsController < ApplicationController

  def create
    # raise params.inspect
    authentication = Authentication.new(
      ENV.fetch('CLIENT_ID'),
      ENV.fetch('CLIENT_SECRET'),
      auth_hash
    )

    user = authentication.authenticate_with_provider
    # see user serializer
    token = user.access_token.token
    redirect_url = ENV['CLIENT_REDIRECT_URL']

    redirect_to "#{redirect_url}?token=#{token}"
  end


  private

  # Get user info from provider
  def auth_hash
    # To access this hash follow this convention: https://github.com/omniauth/omniauth/wiki/Auth-Hash-Schema
    request.env['omniauth.auth'][:info]
  end
end
