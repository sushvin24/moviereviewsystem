class ReviewsController < ApplicationController
  load_and_authorize_resource
  before_action :set_movie
  before_action :authenticate_user!
  # POST /reviews or /reviews.json

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    unless @review.save
      flash[:notice] = @review.errors.full_messages.to_s
    end
    redirect_to movie_path(params[:movie_id])
  end

  # PATCH/PUT /reviews/1 or /reviews/1.json
  def update
    @review = @movie.reviews.find(params[:id])

    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to movie_url(@movie), notice: "Review has been updated." }
      else
        format.html { redirect_to movie_url(@movie), notice: "Review was not updated." }
      end
    end
  end

  # DELETE /reviews/1 or /reviews/1.json
  def destroy
    @review.destroy

    respond_to do |format|
      format.html { redirect_to movie_url(@movie), notice: "Review was deleted." }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_review
    @review = Review.find(params[:id])
  end

  def set_movie
    @movie = Movie.find(params[:movie_id])
  end

  # Only allow a list of trusted parameters through.
  def review_params
    params.require(:review).permit(:comment).merge(movie_id: params[:movie_id])
  end
end
