class Authentication

  attr_accessor :client_id, :client_secret, :params, :user, :application

  # when you have several apps connecting to your ms, you need to determine which app is trying to authenticate (mobile app, react app...). Doorkeeper goes to the db and tries to find that app in the oauth_applications table
  def initialize(client_id, client_secret, params)
    @client_id = client_id
    @client_secret = client_secret
    # will need this to grant access for the user
    @application = Doorkeeper::Application.find_by(
      uid: client_id,
      secret: client_secret
    )
    @params = params
  end

  # Use case 1: create new user & authenticate automatically
  def authenticate_new_user
    self.user = User.new(params)
    if self.user.save
      # produce oauth token
      grant_access
      fetch_oauth_token
    end
    self.user
  end

  # Use case 2: authenticate with password
  def authenticate_with_password
  end

  private

  def grant_access
    access_grant = Doorkeeper::AccessGrant.find_by(
      resource_owner_id: self.user.id,
      application_id: self.application.id
    )

    if access_grant.blank?
      access_grant = Doorkeeper::AccessGrant.create!(
        resource_owner_id: self.user.id,
        application_id: self.application.id,
        expires_in: Doorkeeper.configuration.access_token_expires_in,
        redirect_uri: self.application.redirect_uri
      )
    end
  end

  def fetch_oauth_token
    access_token = Doorkeeper::AccessToken.create(
      resource_owner_id: self.user.id,
      application_id: self.application.id,
      expires_in: Doorkeeper.configuration.access_token_expires_in,
      use_refresh_token: true
    )

    self.user.access_token = access_token
  end
end
