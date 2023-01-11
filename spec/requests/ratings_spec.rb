require 'rails_helper'

RSpec.describe "Ratings", type: :request do

  before(:each) do
    user = User.first
    sign_in user
  end

  describe "GET /ratings" do
    before(:each) do
      movie = Movie.first.ratings
      get "/movies/", params: { id: movie.to_param }
    end

    it "should returns a successful response" do
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /create" do
    it "should create a new rating" do
      Rating.create(rate: 5, movie_id: Movie.first.id, user_id: User.first.id)
      expect(Rating.last.rate).to eq(5)
    end
  end

  describe "PATCH /update" do
    it "should update a rating" do
      rating = Rating.create(rate: 5, movie_id: Movie.first.id, user_id: User.first.id)
      rating.update(rate: 4)
      expect(Rating.find_by_rate(4)).to eq(rating)
    end
  end

  describe "DESTROY /delete" do
    it "should delete a rating" do
      rating = Rating.create(rate: 5, movie_id: Movie.first.id, user_id: User.first.id)
      rating.destroy
      expect(Rating.find_by_rate(5)).to be_nil
    end
  end
end
