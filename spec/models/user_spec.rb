require 'spec_helper'

describe User do
  it 'requires a password' do
    user = User.create(email: 'testy@example.com')
    user.errors.should include('Email is required')
  end

  it 'requires an email'
  it 'digests a password on create'
end
