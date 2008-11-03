require File.dirname(__FILE__) + '/../spec_helper'

describe LiveSearch do
  before(:each) do
    @live_search = LiveSearch.new
  end

  it "should be valid" do
    @live_search.should be_valid
  end
end
