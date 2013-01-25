require 'spec_helper'

describe UsersController do
  it 'registers a user' do
    User.count.should_not == 1

    post :create, user: {email: 'test@example.com', password: 'password', password_confirmation: 'password', nickname: 'testy'}

    response.status.should == 200
    User.count.should == 1
    user = User.first

    json = JSON.parse(response.body)
    json['email'].should    == user.email
    json['nickname'].should == user.nickname
  end

  context 'with a registered' do
    let!(:user) {FactoryGirl.create :user}
    it 'updates nickname'
    it 'unregisters'
    it 'views public profile'
  end
end
