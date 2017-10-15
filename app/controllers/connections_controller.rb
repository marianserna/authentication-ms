class ConnectionsController < ApplicationController
  def create
    byebug 
  end

  private

  # From OmniAuth documentation
  def auth_hash
    request.env['omniauth.auth']
  end
end
