
class InboundMessagesController < ApplicationController
  protect_from_forgery :except => :index

  def index
    #@contact = Contact.find_by(:number => params[:from])
    InboundMessage.new(params[:From])
    respond_to do |format|
      format.any { render status: 200 }
    end
  end

  #private

  # def message_params
  #   params.require(:message).permit(:From)
  # end
end
