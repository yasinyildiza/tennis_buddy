class UsersController < ApplicationController
  skip_before_action :require_login, :only => [:new, :create]
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  respond_to :html

  # GET /users
  # GET /users.json
  def index
    @message = Message.new
    unless params[:q]
       params[:q] = {}
    end
    params[:q][:id_not_eq] = current_user.id
    @search = User.ransack(params[:q])
    @users  = @search.result(distinct: true).includes(:gender, :skill_level, :tennis_club, :tennis_court)

    if @users.count % 2 == 0
      @users_hash = Hash[*(@users.pluck(:id))]
    else
      @users_hash = Hash[*(@users.pluck(:id) + [0])]
    end

    respond_with @users
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save

        invited_users = InvitedUser.where(email: @user.email)
        invited_users.each do |invited_user|
          Message.create(sender_id: 1, receiver_id: invited_user.inviter.id, title: "Your friend has just joined", content: "I have just joined to TennisBuddy World! Thank you for inviting me. #{@user.full_name}")
        end

        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    invited_users = InvitedUser.where(email: @user.email)
    invited_users.each do |invited_user|
      Message.create(sender_id: 1, receiver_id: invited_user.inviter.id, title: "Your friend has just left", content: "I am living TennisBuddy World! Thank you for inviting me, I am really sorry. #{@user.full_name}")
    end
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def broadcast_message_to_list
    notification = 'No user to send message.'
    if params[:user_list]
      notification = 'Message broadcasted to everyone.'
      params[:user_list].each_pair do |key, value|
        if key != "0"
          Message.create(sender_id: current_user.id, receiver_id: key, title: params[:message][:title], content: params[:message][:content])
        end
        if value != "0"
          Message.create(sender_id: current_user.id, receiver_id: value, title: params[:message][:title], content: params[:message][:content])
        end
      end
    end
    respond_to do |format|
      format.html { redirect_to users_url, notice: notification }
      format.json { head :no_content }
    end
  end

  def inbox
  end

  def outbox
  end

  def similar_users
  end

  def users_matches
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :name, :surname, :birthday, :profile_picture, :gender_id, :age, :tennis_club_id, :tennis_court_id, :city_id, :skill_level_id, :about_me)
    end
end
