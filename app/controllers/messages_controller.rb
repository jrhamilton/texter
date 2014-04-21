class MessagesController < ApplicationController
  def new
    @messages = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      flash{:notice} = "Your message was sent!"
      redirect_to new_message_path
    else
      render 'new'
    end
  end


private

  def message_params
    params.require(:message).permit(:to, :from, :body)
  end

end
