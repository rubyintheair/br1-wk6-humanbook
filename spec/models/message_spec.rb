require 'rails_helper'

RSpec.describe Message, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  before do
      @user_1 = User.create name:"Adam", email: "123@gmail.com", password: "123" 
      @user_2 = User.create name:"Quy", email: "1234@gmail.com", password: "1234"
      @message = Message.create sender_id: @user_1.id, recipient_id: @user_2.id, body: "hello girl"
    end 

  it "creates successfully" do 
      expect(@message).to be_valid
    end 
end
