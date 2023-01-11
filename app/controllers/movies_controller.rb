class MoviesController < ApplicationController
  before_action :set_movie, only: %i[ show edit update destroy ]
  protect_from_forgery prepend: true
  before_action :authenticate_user!

  # GET /movies or /movies.json
  def index
    if params[:from_date] and params[:to_date]
      @from_date = params[:from_date]
      @to_date = params[:to_date]
    else
      @from_date = Date.yesterday.strftime('%Y-%m-%d')
      @to_date = Date.today.strftime('%Y-%m-%d')
    end
    @title = params[:title]
    if params[:title]
      @movies = Movie.all.order(ratings_count: :desc).filter_by_title(@title).paginate(page: params[:page], per_page: 10)
    elsif params[:from_date] and params[:to_date]
      @movies = Movie.all.order(ratings_count: :desc).filter_by_date(@from_date, @to_date).paginate(page: params[:page], per_page: 10)
    else
      @movies = Movie.all.order(ratings_count: :desc).paginate(page: params[:page], per_page: 10)
    end

  end

  # GET /movies/1 or /movies/1.json
  def show
    @review = Rating.new
  end

  # GET /movies/new
  def new
    @movie = Movie.new
  end

  # GET /movies/1/edit
  def edit
  end

  # POST /movies or /movies.json
  def create
    @movie = Movie.new(movie_params)

    respond_to do |format|
      if @movie.save
        format.html { redirect_to movie_url(@movie), notice: "Movie was successfully created." }
        format.json { render :show, status: :created, location: @movie }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /movies/1 or /movies/1.json
  def update
    respond_to do |format|
      if @movie.update(movie_params)
        format.html { redirect_to movie_url(@movie), notice: "Movie was successfully updated." }
        format.json { render :show, status: :ok, location: @movie }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movies/1 or /movies/1.json
  def destroy
    @movie.destroy

    respond_to do |format|
      format.html { redirect_to movies_url, notice: "Movie was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movie
      @movie = Movie.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def movie_params
      params.require(:movie).permit(:title, :director, :description, :release_date, :ratings)
    end
end
