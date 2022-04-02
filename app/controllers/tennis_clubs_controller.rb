class TennisClubsController < ApplicationController
  before_action :set_tennis_club, only: [:show, :edit, :update, :destroy]

  # GET /tennis_clubs
  # GET /tennis_clubs.json
  def index
    @tennis_clubs = TennisClub.all
  end

  # GET /tennis_clubs/1
  # GET /tennis_clubs/1.json
  def show
  end

  # GET /tennis_clubs/new
  def new
    @tennis_club = TennisClub.new
  end

  # GET /tennis_clubs/1/edit
  def edit
  end

  # POST /tennis_clubs
  # POST /tennis_clubs.json
  def create
    @tennis_club = TennisClub.new(tennis_club_params)

    respond_to do |format|
      if @tennis_club.save
        format.html { redirect_to @tennis_club, notice: 'Tennis club was successfully created.' }
        format.json { render :show, status: :created, location: @tennis_club }
      else
        format.html { render :new }
        format.json { render json: @tennis_club.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tennis_clubs/1
  # PATCH/PUT /tennis_clubs/1.json
  def update
    respond_to do |format|
      if @tennis_club.update(tennis_club_params)
        format.html { redirect_to @tennis_club, notice: 'Tennis club was successfully updated.' }
        format.json { render :show, status: :ok, location: @tennis_club }
      else
        format.html { render :edit }
        format.json { render json: @tennis_club.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tennis_clubs/1
  # DELETE /tennis_clubs/1.json
  def destroy
    @tennis_club.destroy
    respond_to do |format|
      format.html { redirect_to tennis_clubs_url, notice: 'Tennis club was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tennis_club
      @tennis_club = TennisClub.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tennis_club_params
      params.require(:tennis_club).permit(:city_id, :name, :phone_number, :address)
    end
end
