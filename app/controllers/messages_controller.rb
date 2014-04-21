class MessagesController < ApplicationController
  def index
    @messages = Message.all
  end

  def new
    @message = Message.new
  end

  def create
    @contact = Contact.find_by(:number => message_params[:to])
    @message = Message.new(message_params)
    if @message.save
      @message.update(:contact_id => @contact.id)
      flash[:notice] = "Your message was sent!"
      redirect_to messages_path
    else
      render 'new'
    end
  end

  def show
    @message = Message.find(params[:id])
  end

private

  def message_params
    params.require(:message).permit(:to, :from, :body, :contact_id)
  end

end
