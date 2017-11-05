require_relative '../../app'

describe API::App do
  include Rack::Test::Methods

  def app
    API::App
  end

  context 'GET /api/v1/hello' do
    it "returns an API with 'Hello' and 'World'" do
      get '/api/v1/hello'
      expect(last_response.status).to eq(200)
      expect(JSON.parse(last_response.body)).to eq ({ 'hello' => 'world' })
    end
  end

  context 'GET /api/v1/gettime' do
    it "returns the current time (if not altered)" do
      get '/api/v1/gettime'
      the_time = { time: Time.now }.to_json
      expect(last_response.status).to eq(200)
      expect(last_response.body).to eq(the_time)
    end
  end

  context 'POST /api/v1/settime' do
    it "allows a date and time to be inputted" do
      post('/api/v1/settime', {time: "05:59:59", date: "1988-12-03" })
      get '/api/v1/gettime'
      expect(last_response.body).to eq({ time: '1988-12-03 05:59:59 +0000' }.to_json)
    end
  end

end
