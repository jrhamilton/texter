require 'spec_helper'

describe Message do
  it "it doesn't save the message if twilio gives an error" do
    message = Message.new(:body => 'hi', :to => '111111', :from => '22222222')
    message.save.should be_false
  end
end
