require 'spec_helper'
require 'digest/sha3'

describe Session do
  let!(:user) {FactoryGirl.create :user}
  it 'generates a token upon creation' do
    session = FactoryGirl.create :session, user: user
    session.user.should  == user
    session.token.should == Digest::SHA3.hexdigest("#{session.created_at}#{user.id}")
  end

  it 'Session#authenticate creates a session from a valid email and password' do
    Session.count.should_not == 1
    session = Session.authenticate(user.email, user.password)
    session.should be
    Session.count.should == 1
  end
end
