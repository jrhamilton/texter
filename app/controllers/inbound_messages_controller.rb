
class InboundMessages < ApplicationController

  def index
    #@contact = Contact.find_by(:number => params[:from])
    InboundMessage.new(params[:From])
  end

  #private

  # def message_params
  #   params.require(:message).permit(:From)
  # end
end
