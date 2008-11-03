require File.dirname(__FILE__) + '/../spec_helper'

describe User do
  before(:each) do
    @user = User.new
  end
  
  it "should be invalid without a login" do
    @user.password = "1234"
    @user.should_not be_valid
    @user.login = "barter4u"
    @user.should be_valid
  end
  
  # it "should be invalid without a unique login" do
  #   @user.should_not be_valid
  # end
  
  it "should be invalid without a password" do
    @user.login = "barter4u"
    @user.should_not be_valid
    @user.password = "1234"
    @user.should be_valid
  end
end
