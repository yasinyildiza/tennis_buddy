class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]
  before_action :init_message, only: [:new_broadcast_to_city, :new_broadcast_to_tennis_club, :new_broadcast_to_tennis_court, :new_broadcast_to_gender, :new_broadcast_to_skill_level]

  # GET /messages
  # GET /messages.json
  def index
    @messages = Message.all
  end

  # GET /messages/1
  # GET /messages/1.json
  def show
  end

  # GET /messages/new
  def new
    @message = Message.new
    if params[:id]
      @reply_to = Message.find(params[:id])
    else 
      @reply_to = nil
    end

    if params[:receiver_id]
      @receiver = User.find(params[:receiver_id])
    else
      @receiver = nil
    end
  end

  # GET /messages/1/edit
  def edit
    @reply_to = nil
  end

  # POST /messages
  # POST /messages.json
  def create
    @message = Message.new(message_params)

    respond_to do |format|
      if @message.save
        format.html { redirect_to @message, notice: "Message sent to #{@message.receiver.full_name}." }
        format.json { render :show, status: :created, location: @message }
      else
        format.html { render :new }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /messages/1
  # PATCH/PUT /messages/1.json
  def update
    respond_to do |format|
      if @message.update(message_params)
        format.html { redirect_to @message, notice: 'Message was successfully updated.' }
        format.json { render :show, status: :ok, location: @message }
      else
        format.html { render :edit }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy
    @message.destroy
    respond_to do |format|
      format.html { redirect_to current_user, notice: 'Message was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def new_broadcast_to_city
  end

  def create_broadcast_to_city
    send_message_to_list(current_user.city.users, params)

    respond_to do |format|
      format.html { redirect_to current_user, notice: "Message sent to all users from #{current_user.city.name}." }
      format.json { render :show, status: :created, location: current_user }
    end
  end

  def new_broadcast_to_tennis_club
  end

  def create_broadcast_to_tennis_club
    send_message_to_list(current_user.tennis_club.users, params)

    respond_to do |format|
      format.html { redirect_to current_user, notice: "Message sent to all users from #{current_user.tennis_club.name}." }
      format.json { render :show, status: :created, location: current_user }
    end
  end

  def new_broadcast_to_tennis_court
  end

  def create_broadcast_to_tennis_court
    send_message_to_list(current_user.tennis_court.users, params)

    respond_to do |format|
      format.html { redirect_to current_user, notice: "Message sent to all users from #{current_user.tennis_court.name}." }
      format.json { render :show, status: :created, location: current_user }
    end
  end

  def new_broadcast_to_gender
  end

  def create_broadcast_to_gender
    send_message_to_list(current_user.gender.users, params)

    respond_to do |format|
      format.html { redirect_to current_user, notice: "Message sent to all users from #{current_user.gender.name}." }
      format.json { render :show, status: :created, location: current_user }
    end
  end

  def new_broadcast_to_skill_level
  end

  def create_broadcast_to_skill_level
    send_message_to_list(current_user.skill_level.users, params)

    respond_to do |format|
      format.html { redirect_to current_user, notice: "Message sent to all users from #{current_user.skill_level.name}." }
      format.json { render :show, status: :created, location: current_user }
    end
  end

  private

    def init_message
      @message = Message.new
    end

    def send_message_to_list(users, params)
      users.each do |user|
        unless user == current_user
          Message.create(sender_id: current_user.id, receiver_id: user.id, title: params[:message][:title], content: params[:message][:content])
        end
      end
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def message_params
      params.require(:message).permit(:sender_id, :receiver_id, :title, :content)
    end
end
