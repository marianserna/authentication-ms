class Authentication

  attr_accessor :app_id, :app_secret, :params

  # when you have several apps connecting to your ms, you need to determine which app is trying to authenticate (mobile app, react app...). Doorkeeper goes to the db and tries to find that app in the oauth_applications table
  def initialize(app_id, app_secret, params)
    @app_id = app_id
    @app_secret = app_secret
    @params = params
  end

  # Use case 1: create new user & authenticate automatically
  def authenticate_new_user
    raise params.inspect
  end

  # Use case 2: authenticate with password
  def authenticate_with_apssword
  end
end
