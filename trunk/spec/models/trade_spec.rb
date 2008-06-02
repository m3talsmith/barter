require File.dirname(__FILE__) + '/../spec_helper'

describe Trade do
  before(:each) do
    @trade = Trade.new
  end

  it "should be valid" do
    @trade.should be_valid
  end
end
