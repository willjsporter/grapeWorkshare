require_relative '../../app'

# feature "A basic API page can load" do
#   scenario "Have a hello page that returns an API with 'Hello' and 'World'" do
#     visit '/api/v1/hello'
#     expect(page).to have_content('{"hello":"world"}')
#   end
# end

# describe Grape::API do
#
#   describe 'GET /api/v1/hello' do
#     it "returns an API with 'Hello' and 'World'" do
#       get '/api/v1/hello'
#       expect(JSON.parse(last_response.body)).to eql []
#     end
#   end
#
# end

describe API::App do
  include Rack::Test::Methods

  def app
    API::App
  end

  context 'GET /api/v1/hello' do
    it "returns an API with 'Hello' and 'World'" do
      get '/api/v1/hello'
      expect(last_response.status).to eq(200)
      expect(JSON.parse(last_response.body)).to eq ({"hello"=>"world"})
    end
  end
  # context 'GET /api/statuses/:id' do
  #   it 'returns a status by id' do
  #     status = Status.create!
  #     get "/api/statuses/#{status.id}"
  #     expect(last_response.body).to eq status.to_json
  #   end
  # end
end
