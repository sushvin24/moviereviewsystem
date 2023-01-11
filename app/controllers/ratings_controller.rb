class RatingsController < ApplicationController
  before_action :authenticate_user!
  # POST /ratings or /ratings.json
  def create
      @rating = Rating.new(rating_params)
      @rating.user_id = current_user.id

      unless @rating.save
        flash[:notice] = @rating.errors.full_messages.to_s
      end
      redirect_to movie_path(params[:movie_id])
    end
  # def create
  #   @rating = Rating.new(rating_params)
  #   @rating.user_id = current_user.id
  #
  #   respond_to do |format|
  #     if @rating.save
  #       format.html { redirect_to rating_url(@rating), notice: "Rating was successfully created." }
  #       format.json { render :show, status: :created, location: @rating }
  #     else
  #       format.html { render :new, status: :unprocessable_entity }
  #       format.json { render json: @rating.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # PATCH/PUT /ratings/1 or /ratings/1.json
  # def update
  #   respond_to do |format|
  #     if @rating.update(rating_params)
  #       format.html { redirect_to rating_url(@rating), notice: "Rating was successfully updated." }
  #       format.json { render :show, status: :ok, location: @rating }
  #     else
  #       format.html { render :edit, status: :unprocessable_entity }
  #       format.json { render json: @rating.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /ratings/1 or /ratings/1.json
  def destroy
    @rating.destroy

    respond_to do |format|
      format.html { redirect_to ratings_url, notice: "Rating was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  # def rating_params
  #   params.require(:rating).permit(:rate, :movie_id, :user_id)
  # end
  def rating_params
    params.require(:rating).permit(:rate).merge(movie_id: params[:movie_id])
  end
end
