require 'spec_helper'
require 'digest/sha3'

describe Session do
  let!(:user) {FactoryGirl.create :user}
  it 'generates a token upon creation' do
    session = FactoryGirl.create :session, user: user
    session.user.should  == user
    session.token.should == Digest::SHA3.hexdigest("#{session.created_at}#{user.id}")
  end
end
