class TennisCourtsController < ApplicationController
  before_action :set_tennis_court, only: [:show, :edit, :update, :destroy]

  # GET /tennis_courts
  # GET /tennis_courts.json
  def index
    @tennis_courts = TennisCourt.all
  end

  # GET /tennis_courts/1
  # GET /tennis_courts/1.json
  def show
  end

  # GET /tennis_courts/new
  def new
    @tennis_court = TennisCourt.new
  end

  # GET /tennis_courts/1/edit
  def edit
  end

  # POST /tennis_courts
  # POST /tennis_courts.json
  def create
    @tennis_court = TennisCourt.new(tennis_court_params)

    respond_to do |format|
      if @tennis_court.save
        format.html { redirect_to @tennis_court, notice: 'Tennis court was successfully created.' }
        format.json { render :show, status: :created, location: @tennis_court }
      else
        format.html { render :new }
        format.json { render json: @tennis_court.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tennis_courts/1
  # PATCH/PUT /tennis_courts/1.json
  def update
    respond_to do |format|
      if @tennis_court.update(tennis_court_params)
        format.html { redirect_to @tennis_court, notice: 'Tennis court was successfully updated.' }
        format.json { render :show, status: :ok, location: @tennis_court }
      else
        format.html { render :edit }
        format.json { render json: @tennis_court.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tennis_courts/1
  # DELETE /tennis_courts/1.json
  def destroy
    @tennis_court.destroy
    respond_to do |format|
      format.html { redirect_to tennis_courts_url, notice: 'Tennis court was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tennis_court
      @tennis_court = TennisCourt.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tennis_court_params
      params.require(:tennis_court).permit(:city_id, :name, :phone_number, :address)
    end
end
