require 'rails_helper'

describe 'sessions controller' do
  describe 'login' do
    it 'logs in the user' do
      Doorkeeper::Application.create!(
        name: 'Testing',
        uid: ENV.fetch('CLIENT_ID'),
        secret: ENV.fetch('CLIENT_SECRET'),
        redirect_uri: 'https://localhost:3000'
      )

      user = create(:user)

      post '/sessions', {
        params: {
          email: user.email,
          password: "password"
        }
      }

      expect(response.status).to eq(200)

      parsed_response = JSON.parse(response.body)
      expect(parsed_response["image"]).to eq(nil)
      expect(parsed_response["email"]).to eq(user.email)
      expect(parsed_response["name"]).to eq("Pedro Pedrosa")
    end
  end
end
