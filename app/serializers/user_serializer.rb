class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :image
  attribute :token, if: -> { object.access_token.present? }

  def token
    # object is user
    object.access_token.token
  end

  def image
    object.image.thumb.url
  end
end
