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
    before do
      @user    = FactoryGirl.create :user
      @session = FactoryGirl.create :session, user: @user
    end

    it 'requires a token to update' do
      put :update, id: @user.id, user: {nickname: 'foo'}
      response.status.should == 401

      put :update, token: @session.token, id: @user.id, user: {nickname: 'foo'}
      response.status.should == 200
    end

    it 'requires a token to unregister'
    it 'updates nickname' do
      pending 'tokens from session'
    end

    it 'unregisters'
    it 'views public profile'
  end
end
