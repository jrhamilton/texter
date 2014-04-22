class MessagesController < ApplicationController
  def index
    @messages = Message.all
  end

  def new
    @message = Message.new
  end

  def create
    numbers = params[:message][:to]
    i = 0
    numbers.each do |number|
      if number != ""
        contact = Contact.find_by(:number => number)
        message = Message.new(message_params)
        message[:to] = contact.number
        message[:contact_id] = contact.id
        if message.save
          i += 1
        end
      end
    end
    if i == numbers.length - 1
      flash[:notice] = "Your messages has been sent"
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
