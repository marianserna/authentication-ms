class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :token

  def token
    # object is user
    object.access_token.token
  end
end
