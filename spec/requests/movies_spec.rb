require 'rails_helper'

RSpec.describe "Movies", type: :request do

  before(:each) do
    user = User.first
    sign_in user
  end

  describe "GET /movies" do
    it "should renders the index template" do
      get "/movies"
      expect(response).to render_template("index")
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      movie = Movie.first
      get "/movies/", params: { id: movie.to_param }
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /create" do
    it "should create a new movie" do
      Movie.create(title: "Test Movie", director: "Test Director", description: "Test Description", release_date: "2023-01-09")
      expect(Movie.last.title).to eq("Test Movie")
    end
  end

  describe "PATCH /update" do
    it "should update a movie" do
      movie = Movie.create(title: "Test Movie", director: "Test Director", description: "Test Description", release_date: "2023-01-09")
      movie.update(title: "Test Movie Updated")
      expect(Movie.find_by_title("Test Movie Updated")).to eq(movie)
    end
  end

  describe "DESTROY /delete" do
    it "should delete a movie" do
      movie = Movie.create(title: "Test Movie", director: "Test Director", description: "Test Description", release_date: "2023-01-09")
      movie.destroy
      expect(Movie.find_by_title("Test Movie")).to be_nil
    end
  end

end
