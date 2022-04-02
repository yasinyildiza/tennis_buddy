class UserMatchesController < ApplicationController
  before_action :set_user_match, only: [:show, :edit, :update, :destroy]

  # GET /user_matches
  # GET /user_matches.json
  def index
    @user_matches = UserMatch.all
  end

  # GET /user_matches/1
  # GET /user_matches/1.json
  def show
  end

  # GET /user_matches/new
  def new
    @user_match = UserMatch.new
    @home_user = nil
    @away_user = nil
    if params[:home_user_id]
      @home_user = User.find(params[:home_user_id])
    end
    if params[:away_user_id]
      @away_user = User.find(params[:away_user_id])
    end
  end

  # GET /user_matches/1/edit
  def edit
    @home_user = nil
    @away_user = nil
    if current_user == @user_match.home_user
      @home_user = current_user
    end
    if current_user == @user_match.away_user
      @away_user = current_user
    end
  end

  # POST /user_matches
  # POST /user_matches.json
  def create
    @user_match = UserMatch.new(user_match_params)

    respond_to do |format|
      if @user_match.save
        format.html { redirect_to @user_match, notice: 'User match was successfully created.' }
        format.json { render :show, status: :created, location: @user_match }
      else
        format.html { render :new }
        format.json { render json: @user_match.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_matches/1
  # PATCH/PUT /user_matches/1.json
  def update
    respond_to do |format|
      if @user_match.update(user_match_params)
        format.html { redirect_to @user_match, notice: 'User match was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_match }
      else
        format.html { render :edit }
        format.json { render json: @user_match.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_matches/1
  # DELETE /user_matches/1.json
  def destroy
    @user_match.destroy
    respond_to do |format|
      format.html { redirect_to user_matches_url, notice: 'User match was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def new_current_user_match
  end

  def create_current_user_match
    respond_to do |format|
      if params[:commit] == "Home"
        format.html { redirect_to new_user_match_path(home_user_id: current_user.id), notice: 'Redirected to New User Match view.' }
      else
        format.html { redirect_to new_user_match_path(away_user_id: current_user.id), notice: 'Redirected to New User Match view.' }
      end
      format.json { render :show, status: :created, location: current_user }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_match
      @user_match = UserMatch.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_match_params
      params.require(:user_match).permit(:home_user_id, :away_user_id, :tennis_court_id, :number_of_sets)
    end
end
