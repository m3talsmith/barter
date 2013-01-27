require 'spec_helper'

describe SessionsController do
  let!(:user) {FactoryGirl.create :user}

  it 'creates a session' do
    Session.count.should_not == 1
    post :create, email: user.email, password: 'password'

    response.status.should == 200
    Session.count.should   == 1
  end

  it 'returns a token with the session' do
    post :create, email: user.email, password: 'password'
    user_session = Session.first

    json = JSON.parse(response.body)
    json['user_id'].should == user.id.to_s
    json['token'].should   == user_session.token
  end
end
