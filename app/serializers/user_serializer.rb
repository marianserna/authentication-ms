class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :image
  attribute :token, if: -> { object.access_token.present? }

  def token
    # object is user
    object.access_token.token
  end

  def image
    url = object.image.thumb.url

    return nil if url.nil?

    return url if url.start_with?('http')
    url.prepend('http://localhost:3000')
  end
end
