class ApplicationController < ActionController::Base

  def current_user
    # https://github.com/doorkeeper-gem/doorkeeper#authenticated-resource-owner
    User.find(doorkeeper_token.resource_owner_id) if doorkeeper_token
  end
end
