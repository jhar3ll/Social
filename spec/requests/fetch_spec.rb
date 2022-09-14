require 'rails_helper'

RSpec.describe "FetchesController", type: :request do
  describe "GET /twitter" do 
  it 'returns twitter data response in JSON format' do
    get twitter_path
    expect(response.body).to include('username','tweet').or include('An error has occured. Please try again.')
    expect(response).to have_http_status(200)
    end
  end
end

RSpec.describe "FetchesController", type: :request do
  describe "GET /facebook" do 
  it 'returns facebook data response in JSON format' do
    get facebook_path
    expect(response.body).to include('name', 'status').or include('An error has occured. Please try again.')
    expect(response).to have_http_status(200)
    end
  end
end

RSpec.describe "FetchesController", type: :request do
  describe "GET /instagram" do 
  it 'returns instagram response in JSON format' do
    get instagram_path
    expect(response.body).to include('username', 'picture').or include('An error has occured. Please try again.')
    expect(response).to have_http_status(200)
    end
  end
end

RSpec.describe "FetchesController", type: :request do
  describe "GET '/' " do 
  it 'returns response for all social media sites in JSON format' do
    get '/'
    expect(response.body).to include 'twitter', 'instagram', 'facebook'
    expect(response).to have_http_status(200)
    end
  end
end
