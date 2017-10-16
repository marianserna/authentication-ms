class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email
  attribute :token, if: -> { object.access_token.present? }

  def token
    # object is user
    object.access_token.token
  end
end
