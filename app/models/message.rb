class Message < ActiveRecord::Base
  before_create :send_sms

private
  def send_sms
    response = RestClient::Request.new(
    :method => :post,
    :url => 'https://api.twilio.com/2010-04-01/Accounts/ACe27fd9d2a07030c7587f2cada6316719/Messages.json',
    :user => 'ACe27fd9d2a07030c7587f2cada6316719',
    :password => '53345213cac0cadaa75c3e0ab929bb05',
    :payload => { :Body => body,
                  :From => from,
                  :To => to}
  ).execute
  end
end
