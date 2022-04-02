class MatchSetsController < ApplicationController
  before_action :set_match_set, only: [:show, :edit, :update, :destroy]

  # GET /match_sets
  # GET /match_sets.json
  def index
    @match_sets = MatchSet.all
  end

  # GET /match_sets/1
  # GET /match_sets/1.json
  def show
  end

  # GET /match_sets/new
  def new
    @user_match = nil
    if params[:user_match_id]
      @user_match = UserMatch.find(params[:user_match_id])
    end
    @match_set = MatchSet.new
  end

  # GET /match_sets/1/edit
  def edit
    @user_match = @match_set.user_match
  end

  # POST /match_sets
  # POST /match_sets.json
  def create
    @match_set = MatchSet.new(match_set_params)

    respond_to do |format|
      if @match_set.save
        format.html { redirect_to @match_set.user_match, notice: 'Match set was successfully created.' }
        format.json { render :show, status: :created, location: @match_set }
      else
        format.html { render :new }
        format.json { render json: @match_set.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /match_sets/1
  # PATCH/PUT /match_sets/1.json
  def update
    respond_to do |format|
      if @match_set.update(match_set_params)
        format.html { redirect_to @match_set.user_match, notice: 'Match set was successfully updated.' }
        format.json { render :show, status: :ok, location: @match_set }
      else
        format.html { render :edit }
        format.json { render json: @match_set.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /match_sets/1
  # DELETE /match_sets/1.json
  def destroy
    user_match = @match_set.user_match
    @match_set.destroy
    respond_to do |format|
      format.html { redirect_to user_match, notice: 'Match set was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_match_set
      @match_set = MatchSet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def match_set_params
      params.require(:match_set).permit(:user_match_id, :home_user_score, :away_user_score)
    end
end
