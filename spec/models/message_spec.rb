require 'spec_helper'

describe Message, :vcr => true do
  it "it doesn't save the message if twilio gives an error" do
    message = Message.new(:body => 'hi', :to => '111111', :from => '22222222')
    message.save.should be_false
  end

  it 'adds an error if the number is invalid' do
    message = Message.new(:body => 'hi', :to => '111111', :from => '222222')
    message.save
    binding.pry
    message.errors[:base].should eq ["The 'To' number 111111 is not a valid phone number."]
  end
end
