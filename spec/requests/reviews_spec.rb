require 'rails_helper'

RSpec.describe "Reviews", type: :request do

  before(:each) do
    user = User.first
    sign_in user
  end

  describe "GET /reviews" do
    before(:each) do
      movie = Movie.first.reviews
      get "/movies/", params: { id: movie.to_param }
    end

    it 'returns http success' do
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /create" do
    it "should create a new review" do
      Review.create(comment: "Test Review Comment", movie_id: Movie.first.id, user_id: User.first.id)
      expect(Review.last.comment).to eq("Test Review Comment")
    end
  end

  describe "PATCH /update" do
    it "should update a review" do
      review = Review.create(comment: "Test Review Comment", movie_id: Movie.first.id, user_id: User.first.id)
      review.update(comment: "Test Review Comment Updated")
      expect(Review.find_by_comment("Test Review Comment Updated")).to eq(review)
    end
  end

  describe "DESTROY /delete" do
    it "should delete a review" do
      review = Review.create(comment: "Test Review Comment", movie_id: Movie.first.id, user_id: User.first.id)
      review.destroy
      expect(Review.find_by_comment("Test Review Comment")).to be_nil
    end
  end

end
