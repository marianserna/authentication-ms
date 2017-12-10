require 'rails_helper'

describe 'users controller' do
  describe 'create' do
    it 'creates new user and responds with user + token' do
      Doorkeeper::Application.create!(
        name: 'Testing',
        uid: ENV.fetch('CLIENT_ID'),
        secret: ENV.fetch('CLIENT_SECRET'),
        redirect_uri: 'https://localhost:3000'
      )

      post '/users', {
        params: {
          user: {
            name: "Machete Kill",
            email: "soymachete@vivamexico.com",
            password: "deadly",
            image: fixture_file_upload("#{fixture_path}/machete.jpg")
          }
        }
      }

      expect(response.status).to eq(200)

      parsed_response = JSON.parse(response.body)
      expect(parsed_response["name"]).to eq("Machete Kill")
      expect(parsed_response["image"]).to be_present
      expect(User.count).to eq(1)
    end
  end

  describe 'names' do
    it 'provides the names of the user ids passed' do
      user = create(:user)

      post '/users/names', {
        params: {
          ids: [user.id]
        }
      }

      expect(response.status).to eq(200)

      parsed_response = JSON.parse(response.body)
      expect(parsed_response[user.id.to_s]).to eq("Pedro Pedrosa")
    end
  end

end
