require 'spec_helper'
require 'digest/sha3'

describe User do
  let!(:user_hash) {
    {
      email: 'testy@example.com',
      password: 'password',
      password_confirmation: 'password'
    }
  }

  it 'requires a password' do
    user = User.create(user_hash.merge({password: '', password_confirmation: ''}))
    user.errors.full_messages.should include("Password can't be blank")

    user.password = 'password'
    user.save
    user.errors.full_messages.should include("Password doesn't match confirmation")

    user.password_confirmation = 'password'
    user.save
    user.errors.full_messages.present?.should_not be
  end

  it 'requires an email' do
    user = User.create(user_hash.merge({email: ''}))
    user.errors.full_messages.should include("Email can't be blank")

    user.email = 'testy@example.com'
    user.save
    user.errors.full_messages.present?.should_not be
  end

  it 'User#digest_password should return hashed password' do
    current_time = Time.now
    User.digest_password("password#{current_time}").should == Digest::SHA3.hexdigest("password#{current_time}")
  end

  it 'digests a password on create' do
    user = FactoryGirl.create :user
    user.password_digest.should == Digest::SHA3.hexdigest("#{user.password}#{user.created_at}")
  end
end
