class InboundMessage

  def initialize(from)
    @from = from
    send_sms
  end

  def send_sms
    begin
      response = RestClient::Request.new(
        :method => :post,
        :url => 'https://api.twilio.com/2010-04-01/Accounts/ACe27fd9d2a07030c7587f2cada6316719/Messages.json',
        :user => ENV['TWILIO_ACCOUNT_SID'],
        :password => ENV['TWILIO_AUTH_TOKEN'],
        :payload => { :Body => 'Sorry, No Incoming Messages. You can not respond.',
                      :From => '6095342260',
                      :To => @from}
      ).execute
    rescue RestClient::BadRequest => error
      message = JSON.parse(error.response)['message']
      errors.add(:base, message)
      false
    end
  end
end
