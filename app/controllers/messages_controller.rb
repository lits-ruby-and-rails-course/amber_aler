class MessagesController < ApplicationController
  before_action :find_message, only: [:edit, :update, :destroy]

  def create
    @message = Message.new(message_params)
    @message.user = current_user
    @message.emergency = emergency

    if @message.save
      redirect_to emergency_path(emergency)
    else
      render "emergencies/show"
    end
  end

  def edit
  end

  def update
    if @message.update(message_params)
      redirect_to emergency_path(@message.emergency)
    else
      render :edit
    end
  end

  def destroy
    if @message.destroy
      redirect_to emergency_path(@message.emergency)
    else
      redirect_to emergency_path(@message.emergency), flash: {error: 'Something went wrong'}
    end
  end

  private
  def message_params
    params[:message].permit(:text, :claim_closed)
  end

  def find_message
    @message = Message.find(params[:id])
  end

  def emergency
    @emergency ||= Emergency.find(params[:id])
  end
end
