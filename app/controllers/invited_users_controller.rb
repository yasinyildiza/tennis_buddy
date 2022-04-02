class InvitedUsersController < ApplicationController
  before_action :set_invited_user, only: [:show, :edit, :update, :destroy]

  # GET /invited_users
  # GET /invited_users.json
  def index
    @invited_users = InvitedUser.all
  end

  # GET /invited_users/1
  # GET /invited_users/1.json
  def show
  end

  # GET /invited_users/new
  def new
    @invited_user = InvitedUser.new
  end

  # GET /invited_users/1/edit
  def edit
  end

  # POST /invited_users
  # POST /invited_users.json
  def create
    @invited_user = InvitedUser.new(invited_user_params)

    respond_to do |format|
      if @invited_user.save
        format.html { redirect_to @invited_user, notice: 'Your friend has been invited' }
        format.json { render :show, status: :created, location: @invited_user }
      else
        format.html { render :new }
        format.json { render json: @invited_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /invited_users/1
  # PATCH/PUT /invited_users/1.json
  def update
    respond_to do |format|
      if @invited_user.update(invited_user_params)
        format.html { redirect_to @invited_user, notice: 'Invited user was successfully updated.' }
        format.json { render :show, status: :ok, location: @invited_user }
      else
        format.html { render :edit }
        format.json { render json: @invited_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invited_users/1
  # DELETE /invited_users/1.json
  def destroy
    @invited_user.destroy
    respond_to do |format|
      format.html { redirect_to current_user, notice: 'Invited user was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invited_user
      @invited_user = InvitedUser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def invited_user_params
      params.require(:invited_user).permit(:inviter_id, :email)
    end
end
