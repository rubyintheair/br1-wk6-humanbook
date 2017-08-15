require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  let(:valid_attributes) { {name: "Quy", email: "quy123@gmail.com", password: "1234"} } 
  let(:valid_user) {User.create(valid_attributes)}
  let(:valid_session) { {user_id: valid_user.id} }
  context "user is logged in" 
    describe "GET#index" do 
      it "returns a success respone" do 
        user = User.create name: "Quy", email: "quy123@gmail.com", password: "1234"
        get :index, params: {}, session: valid_session
        expect(response).to be_success   
      end 
    end 

  context "user is logged in - version update let ()" 
    describe "GET#index" do 
      it "returns a success respone" do 
        get :index, params: {}, session: valid_session
        expect(response).to be_success   
      end 
    end 

  context "user is not logged in" 
    describe "GET#index" do 
      it "redirects to the home page" do 
        get :index, params: {}, session: {}
        expect(response).to redirect_to(root_path)
      end 
    end 

  context "user is logged"
    describe "Get#index" do 
      it "loads all users" do 
        user = User.create name: "Adam", email: "123@gmail.com", password: "1234"
        get :index, params: {}, session: {user_id: user.id}
        expect(assigns(:users)).to eq [user]
      end 
    end 

  


end
